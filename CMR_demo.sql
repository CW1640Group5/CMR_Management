

create table Role(
 Role_id int primary key,
 Role_type varchar2(30)
);

Create table CMR_Users(
  User_id int primary key,
  User_name varchar2(20),
  gender  char CONSTRAINT user_check check (gender in ('F','M')),
  DOB date,
  Role_id int,
  address varchar2(100),
  phone varchar2(20),
  mail varchar2(100),
  FOREIGN KEY (Role_id) REFERENCES Role(Role_id)
);

Create table Administrators(
  Admin_id int primary key,
  User_id int,
  FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id)
);

create table Course(
 Course_id varchar2(20) primary key,
 Course_name varchar2(100),
 start_time date,
 end_time date
);

create table CL(
 User_id int,
 Course_id varchar2(20),
 assign_time date,
  constraint pk_CL PRIMARY KEY (User_id,Course_id),
     FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
     FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
);


