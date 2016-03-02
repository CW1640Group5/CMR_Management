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
    CL_id       VARCHAR2(20) PRIMARY KEY,
    User_id     INT,
    Course_id   VARCHAR2(20),
    assign_time DATE,
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
    FOREIGN KEY (CL_id) REFERENCES CL(CL_id),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id)
  );
