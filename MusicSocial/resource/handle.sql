Use MusicNetwork
go



DECLARE @TestVal INT
SET @TestVal = 4
SELECT
CASE @TestVal
WHEN 1 THEN 'First'
WHEN 2 THEN 'Second'
WHEN 3 THEN 'Third'
ELSE 'Other'
END

DECLARE @TestVal INT
SET @TestVal = 5
SELECT
CASE
WHEN @TestVal <=3 THEN 'Top 3'
ELSE 'Other'
END

select phanbiet = (case when AccountId < 2 then 'nho hon 2'
else 'lon hon hay bang 2' end)
from Account

-- get comments in a post
declare @PostId int = 13,
		@Type bit = 0
select *, dbo.udf_get_counting_like_by_likePlaceId(CommentId, @Type) as CountingLikeComment from Comment where PostId = @PostId

-- Who like for a comment?
select L.LikePlaceId as [CommentId], L.LikeId, C.PostId, A.AccountId as LikePersonId, A.Name, A.Email from Likes as L
join Account as A on L.AccountId = A.AccountId
join Comment as C on L.LikePlaceId = C.CommentId and L.Type = 0
where L.Type=0 and L.LikePlaceId = 7


select * from Post order by Time desc



declare @var int
select @var = CommentId from Comment where CommentId = 100000 order by Time desc
if(@var is null) select 'la null'

ALTER TABLE Relationship
ADD CONSTRAINT UserId1 CHECK (condition);

select * from Comment order by Time desc


CREATE TABLE Post(
	PostId int identity PRIMARY KEY,
	AccountId int not null,
	Content ntext not null,
	Time datetime not null,
	CONSTRAINT fk_post FOREIGN KEY(AccountId) REFERENCES Account(AccountId)
)

--------------------------------------------------------
create table Post(
	PostId int identity primary key
	AccountId int not null,
	Time datetime not null,
)

create table PostText(
	PostId int primary key,
	PostText ntext
)

create table PostAudio(
	PostId int,
	FileAudioId int,
	primary key (PostId, FileAudioId)
)

create table PostPhoto(
	PostId int,
	FilePhotoId int,
	primary key (PostId, FilePhotoId)
)

select * from Post order by Time desc