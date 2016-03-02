--CREATE DATABASE MusicNetwork
USE MusicNetwork
GO

DROP TABLE MusicOwner
DROP TABLE MusicFile
DROP TABLE Song
DROP TABLE Category
DROP TABLE Artist
DROP TABLE Chat
DROP TABLE Likes
DROP TABLE Comment
DROP TABLE Post
DROP TABLE Relationship
DROP TABLE Account

CREATE TABLE Account(
	AccountId int identity PRIMARY KEY,
	Password varchar(60) not null,
	Email varchar(50) unique not null,
	Name nvarchar(30) not null,
	Avatar varchar(MAX),
	Online bit,
	SessionId varchar(200)
)

CREATE TABLE Relationship(
	RelationshipId int identity(1,1) PRIMARY KEY,
	UserId1 int not null,
	UserId2 int not null check (UserId2 <> UserId1),
	Status varchar(20) not null, -- 0: no relation, 1: friend, 2: request
	CONSTRAINT fk_relationship1 FOREIGN KEY(UserId1) REFERENCES Account(AccountId),
	CONSTRAINT fk_relationchip2 FOREIGN KEY(UserId2) REFERENCES Account(AccountId)
)

--ALTER TABLE Relationship
--ADD CONSTRAINT UserId2 CHECK (UserId2 <> UserId1)


CREATE TABLE Post(
	PostId int identity PRIMARY KEY,
	AccountId int not null,
	Content ntext not null,
	Time datetime not null,
	CONSTRAINT fk_post FOREIGN KEY(AccountId) REFERENCES Account(AccountId)
)

CREATE TABLE Comment(
	CommentId int identity PRIMARY KEY,
	PostId int not null,
	AccountId int not null,
	Content nvarchar(1000) not null,
	Time datetime not null,
	CONSTRAINT fk_comment1 FOREIGN KEY(PostId) REFERENCES Post(PostId),
	CONSTRAINT fk_comment2 FOREIGN KEY(AccountId) REFERENCES Account(AccountId)
)

CREATE TABLE Likes(
	LikeId int identity PRIMARY KEY,
	AccountId int not null,
	LikePlaceId int not null,
	Type bit not null, -- 1: Post  -  0: Comment
	CONSTRAINT un_likes UNIQUE(AccountId, LikePlaceId, Type),
	CONSTRAINT fk_likes FOREIGN KEY(AccountId) REFERENCES Account(AccountId)
)

CREATE TABLE Chat(
	RelationshipId int not null,
	Content nvarchar(255) not null,
	Direction bit,
	Time datetime not null,
	CONSTRAINT fk_chat FOREIGN KEY(RelationshipId) REFERENCES Relationship(RelationshipId) 
)

CREATE TABLE Artist(
	ArtistId int identity PRIMARY KEY,
	ArtistName nvarchar(100) not null unique
)

CREATE TABLE Category(
	CategoryId int identity PRIMARY KEY,
	Name nvarchar(100) not null
)

CREATE TABLE Song(
	SongId int identity PRIMARY KEY,
	Title nvarchar(100) not null unique
)


CREATE TABLE MusicFile(
	FileId int identity PRIMARY KEY,
	FileName varchar(100) not null unique,
	ListenTimes int not null default 0
)

CREATE TABLE MusicOwner(
	AccountId int not null,
	FileId int not null,
	CategoryId int,
	ArtistId int,
	SongId int,
	CONSTRAINT fk_musicowner1 FOREIGN KEY(AccountId) REFERENCES Account(AccountId),
	CONSTRAINT fk_musicowner2 FOREIGN KEY(FileId) REFERENCES MusicFile(FileId),
	CONSTRAINT fk_musicowner3 FOREIGN KEY(CategoryId) REFERENCES Category(CategoryId),
	CONSTRAINT fk_musicowner4 FOREIGN KEY(ArtistId) REFERENCES Artist(ArtistId),
	CONSTRAINT fk_musicowner5 FOREIGN KEY(SongId) REFERENCES Song(SongId),
	CONSTRAINT pk_musicowner primary key(AccountId, FileId)
)

--/////////////////////// INSERT DATA ////////////////////////
insert into Account(Password, Email, Name, Avatar, Online) values
('21232f297a57a5a743894a0e4a801fc3', 'b1@gmail.com', N'B1', 'batman.jpg', '0'),
('21232f297a57a5a743894a0e4a801fc3', 'b2@gmail.com', N'B2', 'batman.jpg', '0'),
('21232f297a57a5a743894a0e4a801fc3', 'paul@gmail.com', N'Paul', 'batman.jpg', '0'),
('21232f297a57a5a743894a0e4a801fc3', 'john@gmail.com', N'John', 'batman.jpg', '0'),
('21232f297a57a5a743894a0e4a801fc3', 'george@gmail.com', N'George', 'batman.jpg', '0'),
('21232f297a57a5a743894a0e4a801fc3', 'ringo@gmail.com', N'Ringo', 'batman.jpg', '0'),
('21232f297a57a5a743894a0e4a801fc3', 'tintin@gmail.com', N'Tintin', 'batman.jpg', '0'),
('21232f297a57a5a743894a0e4a801fc3', 'batman@gmai.com', N'Batman', 'batmanjpg', '0'),
('21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', N'admin', 'batman.jpg', '0'), --admin = 21232f297a57a5a743894a0e4a801fc3
('21232f297a57a5a743894a0e4a801fc3', 'pooh@gmail.com', N'Pooh', 'batman.jpg', '0')

insert into Relationship(UserId1, UserId2, Status) values
('1', '2', '1'),
('1', '3', '1'),
('3', '4', '1'),
('4', '5', '1')

insert into Post(AccountId, Content, Time) values
('1', '1_1 Ta cung co gang', GETDATE()),
('2', '2_1 Ta cung co gang', GETDATE()),
('3', '3_1 Ta cung co gang', GETDATE()),
('3', '3_2 Ta cung co gang', GETDATE()),
('4', '4_ Ta cung co gang', GETDATE()),
('5', '5_ Ta cung co gang', GETDATE()),
('1', '1_2 Ta cung co gang', GETDATE())

insert into Likes(AccountId, LikePlaceId, Type) values
('1', '1', '1'),
('2', '1', '1'),
('3', '1', '1'),
('4', '1', '1')

-- insert Comment
--type1:
select * from Comment
insert into Comment(PostId, AccountId, Content, Time) values
('14', '2', 'Mr Moonlight look and see107', GETDATE()),
('14', '1', 'Mr Moonlight look and see100', GETDATE()),
('14', '2', 'Mr Moonlight look and see100', GETDATE())
--type2:
declare @CountPost int, @CountAccount int, @CountComment int
select @CountPost = COUNT(*) from Post
select @CountAccount = COUNT(*) from Account
INSERT INTO Comment(Content, PostId, AccountId, Time) VALUES
('Mr Moonlight look and see' + CONVERT(VARCHAR, case (select count(*) from Comment)
													when 0 then 0
													else @@IDENTITY end ),
dbo.udf_get_random_number(1, @CountPost+1), dbo.udf_get_random_number(1, @CountAccount), GETDATE())
go 10000

select * from Comment
-- insert Likes
declare @countAccount int,
		@likePlaceId int,
		@type bit = 0 -- assign to 1 for inserting Post and assign to 0 for inserting Comment
select @countAccount = COUNT(*) from Account
if(@type = 1)
	select @likePlaceId = COUNT(*) from Post
else
	select @likePlaceId = COUNT(*) from Comment

insert into Likes(AccountId, LikePlaceId, Type) values
(dbo.udf_get_random_number(1, @countAccount+1), dbo.udf_get_random_number(0, @likePlaceId+1), @type)
go 10000

--insert Category
insert into Category(Name) values
(N'Rock'),
(N'Pop'),
(N'Rap & Hip-Hop'),
(N'House & Dance'),
(N'Alternative'),
(N'Instrumental'),
(N'Metal'),
(N'Acoustic & Vocal'),
(N'Classical'),
(N'Electropop & Disco'),
(N'Ethnic')

-- insert Song
insert into Song(Title) values
(N'I Saw Her Standing There'),
(N'One After 909 [Take 2]'),
(N'She''s a Woman'),
(N'I''m Looking Through You'),
(N'If You''ve Got Trouble'),
(N'How Do You Do It'),
(N'Because'),
(N'baby, i''m a rich man'),
(N'i buy you diamond ring'),
(N'i just want to dance with you'),
(N'i need you'),
(N'i need your hand'),
(N'i want to go to dinner with you'),
(N'i''m a looser'),
(N'i''m down'),
(N'i''ve done'),
(N'i''ve got a feeling'),
(N'mama, i''m hungry'),
(N'please don''t kill me John because I''m sorry'),
(N'really need a cocacola, I''m always be true')

-- insert Artist
insert into Artist(ArtistName) values
(N'The Beatles'),
(N'Đan Trường'),
(N'Michael Jackson'),
(N'Mary Hopskin'),
(N'Mỹ Tâm')

--insert MusicFile
insert into MusicFile(FileName) values
(N'01 I Saw Her Standing There.wav'),
(N'02 One After 909 [Take 2].wav'),
(N'03 She''s a Woman.wav'),
(N'04 I''m Looking Through You.wav'),
(N'05 If You''ve Got Trouble.wav'),
(N'06 How Do You Do It.wav')

--insert MusicOwner
insert into MusicOwner(AccountId, FileId, CategoryId, ArtistId, SongId) values
('1', '1', '1', '1', '1'),
('2', '1', '2', '2', '1'),
('3', '1', '3', '1', '1'),
('4', '1', '4', '1', '3'),
('5', '1', '5', '1', '1'),
('6', '1', '1', '1', '1'),
('1', '2', null, null, null)

