CREATE TABLE Role
  ( Role_id INT PRIMARY KEY, Role_type VARCHAR2(30)
  );
CREATE TABLE CMR_Users
  (
    User_id   INT PRIMARY KEY,
    User_name VARCHAR2(20),
    gender    CHAR CONSTRAINT user_check CHECK (gender IN ('F','M')),
    DOB       DATE,
    Role_id   INT,
    address   VARCHAR2(100),
    phone     VARCHAR2(20),
    mail      VARCHAR2(100),
    FOREIGN KEY (Role_id) REFERENCES Role(Role_id)
  );
CREATE TABLE Administrators
  (
    Admin_id INT PRIMARY KEY,
    User_id  INT,
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id)
  );
CREATE TABLE Course
  (
    Course_id   VARCHAR2(20) PRIMARY KEY,
    Course_name VARCHAR2(100),
    start_time  DATE,
    end_time    DATE
  );
CREATE TABLE faculty
  (
    faculty_id   VARCHAR2(20) PRIMARY KEY,
    faculty_name VARCHAR2(100),
    Course_id    VARCHAR2(20),
    class_id     VARCHAR2(20),
    start_time   DATE,
    end_time     DATE,
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
  );
  
CREATE TABLE CL
  (
    CL_id       VARCHAR2(20),
    User_id     INT,
    Course_id   VARCHAR2(20),
    assign_time DATE,
    CONSTRAINT pk_CL PRIMARY KEY (CL_id,Course_id),
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
  );
  
CREATE TABLE PVC
  (
    User_id     INT,
    faculty_id  VARCHAR2(20),
    assign_time DATE,
    CONSTRAINT pk_PVC PRIMARY KEY (User_id,faculty_id),
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
  );
CREATE TABLE DLT
  (
    DLT_id      VARCHAR2(20),
    User_id     INT,
    faculty_id  VARCHAR2(20),
    assign_time DATE,
    FOREIGN KEY (User_id) REFERENCES CMR_Users(User_id),
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id)
  );
CREATE TABLE CMR
  (
    CMR_id       INT PRIMARY KEY,
    type         VARCHAR2(100),
    documentcode VARCHAR2(20),
    name         VARCHAR2(200),
    LINK         VARCHAR2(300),
    CL_id        VARCHAR2(20),
    Course_id    VARCHAR2(20),
    static       VARCHAR2(20),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
  );  
  
  --insert new course Giap
  create or replace procedure addNewCourse(
    p_id in Course.Course_id%TYPE,
    p_name in Course.Course_name%TYPE,
    p_start_time in Course.start_time%TYPE,
    p_end_time in Course.end_time%TYPE
  )
  is
  begin
    insert into Course values (p_id, p_name, to_date(p_start_time,'mm-dd-yyyy'), to_date(p_end_time,'mm-dd-yyyy'));
  end;
  insert into Course values ('C12345','Web Design', to_date('01-01-2016','mm-dd-yyyy'), to_date('01-01-2017','mm-dd-yyyy'));
  select * from Course;
  --end insert new course Giap
  

insert into Course values('comp_1640','Enterprise Web Software',TO_DATE('01-10-2016','mm-dd-yyyy'),TO_DATE('04-14-2016','mm-dd-yyyy'));
insert into Course values('comp_1649','interaction design',TO_DATE('01-10-2016','mm-dd-yyyy'),TO_DATE('04-28-2016','mm-dd-yyyy'));
insert into Course values('comp_1661','Application Development for Mobile Devices',TO_DATE('01-10-2016','mm-dd-yyyy'),TO_DATE('04-15-2016','mm-dd-yyyy'));

CREATE SEQUENCE seq_role_id;
insert into Role values(seq_role_id.nextval,'admin');
insert into Role values(seq_role_id.nextval,'staff');

CREATE SEQUENCE seq_User_id;
insert into CMR_Users values(seq_User_id.nextval,'Mr.A','M',TO_DATE('01-10-1990','mm-dd-yyyy'),2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values(seq_User_id.nextval,'Mr.B','M',TO_DATE('01-10-1990','mm-dd-yyyy'),2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values(seq_User_id.nextval,'Mr.C','M',TO_DATE('01-10-1990','mm-dd-yyyy'),2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values(seq_User_id.nextval,'Mr.D','M',TO_DATE('01-10-1990','mm-dd-yyyy'),2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values(seq_User_id.nextval,'Mr.E','M',TO_DATE('01-10-1990','mm-dd-yyyy'),2,'asadsda','0123456789','sdaas@asd.com');
insert into CMR_Users values(seq_User_id.nextval,'Mr.F','M',TO_DATE('01-10-1990','mm-dd-yyyy'),2,'asadsda','0123456789','sdaas@asd.com');

insert into CL values('cl001',1,'comp_1640',TO_DATE('01-10-2016','mm-dd-yyyy'));
insert into CL values('cl001',1,'comp_1649',TO_DATE('01-10-2016','mm-dd-yyyy'));
insert into CL values('cl001',1,'comp_1661',TO_DATE('01-10-2016','mm-dd-yyyy'));
