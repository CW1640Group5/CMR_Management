drop database CMR;
go
create database CMR;
go
use CMR;
go
CREATE TABLE Role
  ( 
	Role_id INT PRIMARY KEY identity(1,1),
	Role_type nvarchar(30)
  );
 go
CREATE TABLE CMR_Users
  (
    User_id   INT PRIMARY KEY identity(1,1),
    User_name nvarchar(20),
    gender    CHAR CONSTRAINT user_check CHECK (gender IN ('F','M')),
    DOB       date,
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
CREATE TABLE Course
  (
    Course_id   nvarchar(20) PRIMARY KEY,
    Course_name nvarchar(100),
    start_time  datetime,
    end_time    datetime
  );
  go
CREATE TABLE faculty
  (
    faculty_id   nvarchar(20) PRIMARY KEY,
    faculty_name nvarchar(100),
    Course_id    nvarchar(20),
    class_id     nvarchar(20),
    start_time   datetime,
    end_time     datetime,
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
  );
  go
CREATE TABLE CL
  (
    CL_id       nvarchar(20),
    User_id     INT,
    Course_id   nvarchar(20),
    assign_time datetime,
    CONSTRAINT pk_CL PRIMARY KEY (CL_id,Course_id),
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
  );
  go
CREATE TABLE PVC
  (
    User_id     INT ,
    faculty_id  nvarchar(20),
    assign_time datetime,
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
    assign_time datetime,
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
  );
  go
CREATE TABLE CMR
  (
    CMR_id       INT PRIMARY KEY identity(1,1),
    type         nvarchar(100),
    documentcode nvarchar(20),
    name         nvarchar(200),
    LINK         nvarchar(300),
    CL_id        nvarchar(20),
    Course_id    nvarchar(20),
    static       nvarchar(20),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
  );

--INSERT DATABASE HERE
go
insert into Course values('comp_1640','Enterprise Web Software','01-10-2016','04-14-2016');
insert into Course values('comp_1649','interaction design','01-10-2016','04-28-2016');
insert into Course values('comp_1661','Application Development for Mobile Devices','01-10-2016','04-15-2016');

go
insert into faculty values ('fac001', 'Nguyen Thuy Duong', 'comp_1640', 'B14', '01-10-2016', '01-10-2017');
insert into faculty values ('fac002', 'Jaya', 'comp_1649', 'B14', '01-10-2016', '01-10-2017');
insert into faculty values ('fac003', 'Ngo Tung Son', 'comp_1661', 'B14', '01-10-2016', '01-10-2017');

go
insert into Role values
('Role_type_1'), 
('role_type_2'), 
('role_type_3');

go
insert into CMR_Users values('Admin','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Nguyen Thuy Duong','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Jaya','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Ngo Tung Son','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.E','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.F','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.G','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.H','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.I','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.J','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.K','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.L','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.M','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values('Mr.N','M','01-10-1990',2,'asadsda','0123456789','sdaas@asd.com');
 
go
insert into Administrators values (1);
select*from Administrators

go
insert into CL values('cl001',1,'comp_1640','01-10-2016');
insert into CL values('cl001',1,'comp_1649','01-10-2016');
insert into CL values('cl001',1,'comp_1661','01-10-2016');

go
insert into PVC values (2, 'fac001', '02-10-2016');
insert into PVC values (3, 'fac002', '02-10-2016');
insert into PVC values (4, 'fac003', '02-10-2016');

go
insert into DLT values('DLT_01', 5, 'fac001', '03-10-2016');
insert into DLT values('DLT_02', 6, 'fac001', '03-10-2016');
insert into DLT values('DLT_03', 7, 'fac001', '03-10-2016');
insert into DLT values('DLT_04', 8, 'fac001', '03-10-2016');
insert into DLT values('DLT_05', 9, 'fac001', '03-10-2016');
insert into DLT values('DLT_06', 10, 'fac001', '03-10-2016');

go
insert into CMR values ('type1', 'docode01', 'CMR_Name_1', '#', 'cl001', 'comp_1640', 'static 1');
insert into CMR values ('type2', 'docode02', 'CMR_Name_2', '#', 'cl001', 'comp_1640', 'static 2');
insert into CMR values ('type3', 'docode03', 'CMR_Name_3', '#', 'cl001', 'comp_1640', 'static 3');
insert into CMR values ('type4', 'docode04', 'CMR_Name_4', '#', 'cl001', 'comp_1640', 'static 4');
insert into CMR values ('type5', 'docode05', 'CMR_Name_5', '#', 'cl001', 'comp_1640', 'static 5');
insert into CMR values ('type6', 'docode06', 'CMR_Name_6', '#', 'cl001', 'comp_1640', 'static 6');

--END INSERT DATABASE
