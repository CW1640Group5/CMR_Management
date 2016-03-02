Use MusicNetwork
go

--Register
drop procedure usp_Register
go
create procedure usp_Register
@password varchar(50),
@email varchar(50),
@name varchar(30)
as
begin
	insert into Account(Password, Email, Name) values
	(@password, @email, @name)
end
select * from Account
go

-- Login
drop procedure usp_Login
go
create procedure usp_Login
	@email varchar(50),
	@password varchar(50)
as
Begin
	select AccountId, Name, Avatar, Online from Account where Email = @email and Password = @password
end
go

--test1
exec usp_Login @email = 'admin@gmail.com', @password = '21232f297a57a5a743894a0e4a801fc3'
exec usp_Login '', 'd41d8cd98f00b204e9800998ecf8427e'
go
select * from Account
go
--session proc
drop procedure usp_SessionId
go
create procedure usp_SessionId
	@sessionId varchar(200),
	@email varchar(50)
as
begin
	update Account set SessionId = @sessionId where Email = @email;
end
go
update Account set SessionId = '861bffbe48424eda5ae73daeb509' where Email = 'admin@gmail.com';
go
select * from Account

--💀1 create post
drop proc usp_post
go
create proc usp_post
	@postId int out,
	@ownerId int,
	@content ntext
as
begin
	insert into Post(AccountId, Content, Time) values (@OwnerId, @content, GETDATE())
	set @postId = SCOPE_IDENTITY()
end
--test1
select * from Post order by Time desc
go
--💀2 get posts + get comments in each post
-- I.Self-Post
select * from Post where AccountId = '3'
go

-- II.Frield-Post(+Own-Post)
-- step1: lay ra tat ca ban cua toi
DROP proc usp_getFriendsByAccountId
GO
CREATE proc usp_getFriendsByAccountId
	@OwnerId int
AS
BEGIN
	SELECT dbo.Relationship.RelationshipId,
	dbo.Account.AccountId, dbo.Account.Name, dbo.Account.Online, dbo.Account.Avatar FROM Relationship
	JOIN Account ON Account.AccountId=Relationship.UserId1
	WHERE UserId2 = @OwnerId AND Status='1' 
		union
	SELECT dbo.Relationship.RelationshipId,
	dbo.Account.AccountId, dbo.Account.Name, dbo.Account.Online, dbo.Account.Avatar FROM Relationship
	JOIN Account ON Account.AccountId=Relationship.UserId2
	WHERE USerId1 = @OwnerId  AND Status='1'
END
GO
--test1
exec usp_getFriendsByAccountId 1
go

-- step2: lay ra tat ca post cua ban toi (tùy chọn: thêm các post của tôi)
drop proc usp_getFriendPost
go
create proc usp_getFriendPost
	@AccountId int,
	@PageNumber int,
	@RowsPage int
as
begin
	DECLARE @Friends TABLE(
		RelationshipId int,
		AccountId int,
		Name nvarchar(30),
		Online bit,
		Avatar varchar(MAX)
	)
	insert into @Friends exec usp_getFriendsByAccountId @AccountId;

	select dbo.Post.PostId, dbo.Post.Content as [PostContent], dbo.Post.Time as [PostTime],
	dbo.Account.AccountId as [PostAccountId], dbo.Account.Name as [PostName], dbo.Account.Avatar as [PostAvatar],
	dbo.udf_get_counting_like_by_likePlaceId(PostId,1) as [CountingLikePost],
	dbo.udf_is_liked(@AccountId, dbo.Post.PostId, 1) as [isLikedPost]
	from dbo.Post 
	inner join dbo.Account on dbo.Post.AccountId = dbo.Account.AccountId
	where dbo.Post.AccountId in (select AccountId from @Friends)
	or dbo.Post.AccountId = @AccountId -- get Own Post
	order by dbo.Post.Time desc
	OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
	FETCH NEXT @RowsPage ROWS ONLY
end
go
--test1
declare @OwnerId int = 1,
		@PostId int = 4,
		@PageNumber int = 1,
		@RowsPage int = 3
exec usp_getFriendPost @OwnerId, @PageNumber, @RowsPage
--test2: lấy thông tin về các cái like trên 1 post
select * from vw_like_post where LikeAccountId = @OwnerId and PostId = @PostId
go
-- III.Get comment in a post
drop proc usp_getCommentOfAPost
go

create proc usp_getCommentOfAPost
	@PostId int,
	@AccountId int
as
begin
	select dbo.Comment.CommentId, dbo.Comment.Content as [CommentContent], dbo.Comment.Time as [CommentTime],
	dbo.Account.AccountId as [CommentAccountId], dbo.Account.Name as [CommentName], dbo.Account.Avatar as [CommentAvatar],
	dbo.udf_get_counting_like_by_likePlaceId(dbo.Comment.CommentId, 0) as [CountingLikeComment],
	dbo.udf_is_liked(@accountId, dbo.Comment.CommentId, 0) as [isLikedComment]
	from dbo.Comment
	inner join dbo.Account on dbo.Comment.AccountId = dbo.Account.AccountId
	where PostId = @postId
end
go
--test1
declare @postId int = 32,
		@ownerId int = 1,
		@commentId int = 98
exec usp_getCommentOfAPost @postId, @ownerId
--1 comment cụ thể có like nào và thông tin của mỗi comment
select * from vw_comment where CommentId = @commentId

select * from vw_like_comment where LikeAccountId = @ownerId and CommentId = @commentId
go
--💀3 addLike
drop proc usp_addLike
go
create proc usp_addLike
	@LikeId int out,
	@LikePlaceId int,
	@Type bit,
	@AccountId int
as
begin
	insert into Likes(LikePlaceId, Type, AccountId) values (@LikePlaceId, @Type, @AccountId)
	set @LikeId = SCOPE_IDENTITY()
end
go

--test1: add like to a post
/*  
	stp1: have an account
	stp2: have a post
*/
declare @LikeId int,
		@PostId int = 14,
		@AccountId int = 1,
		@Type bit = 1
exec usp_addLike @LikeId out, @PostId, @Type, @AccountId
select @LikeId


select * from vw_like_post where PostId = @PostId
go

--test2: add like to a comment
declare @LikeId int,
		@CommentId int = 1,
		@AccountId int = 6,
		@Type bit = 0 --forget it!
exec usp_addLike @LikeId out, @CommentId, @Type, @AccountId
select @LikeId

select * from vw_like_comment where CommentId = @CommentId
--💀4 deleteLike
drop proc usp_deleteLike
go
create proc usp_deleteLike
	@OwnerId int,
	@LikePlaceId int,
	@Type bit
as
begin
	delete from Likes where AccountId = @OwnerId and LikePlaceId = @LikePlaceId and Type = @Type
end
go
--test1: delete like in a post
declare @OwnerId int = 1,
		@PostId int = 2,
		@Type bit = 1
select * from vw_like_post where PostId = @PostId --before delete
exec usp_deleteLike @OwnerId, @PostId, @Type
select * from vw_like_post where PostId = @PostId	--after delete
go
--test2: delete like in a comment
select * from vw_comment	-- see comment that you wish to delete like
declare @OwnerId int = 3,
		@CommentId int = 5,
		@Type bit = 0
select * from vw_like_comment where CommentId = @CommentId --before delete
exec usp_deleteLike @OwnerId, @CommentId, @Type
select * from vw_like_comment where CommentId = @CommentId --after delete
go
--💀5 addComment
drop proc usp_addComment
go

create proc usp_addComment
	@CommentId int out,
	@Time datetime out,
	@OwnerId int,
	@Content nvarchar(1000),
	@PostId int
as
begin
	set @Time = GETDATE()
	insert into Comment(Content, Time, PostId, AccountId) values (@Content, @Time, @PostId, @OwnerId)
	set @CommentId = SCOPE_IDENTITY()
end
go
--test1:
declare @CommentId int,
		@Time datetime,
		@OwnerId int = 2,
		@Content nvarchar(1000) = N'Yes, I'''' try',
		@PostId int = 33
--select * from vw_post_comment where PostId = @postId --before
exec usp_addComment @CommentId out, @Time out, @OwnerId, @Content, @PostId
select * from vw_post_comment where PostId = @PostId --after
select * from Comment order by Time desc
--💀6 getMyMusic
drop proc usp_getMyMusic
go
create proc usp_getMyMusic
	@OwnerId int
as
begin
	-- this proc select FileId because we use it to edit song
	select dbo.Song.Title, dbo.Artist.ArtistName, dbo.MusicFile.FileId, dbo.MusicFile.FileName
	from dbo.MusicOwner
	inner join dbo.MusicFile on dbo.MusicOwner.FileId = dbo.MusicFile.FileId
	left join dbo.Artist on dbo.MusicOwner.ArtistId = dbo.Artist.ArtistId
	left join dbo.Song on dbo.MusicOwner.SongId = dbo.Song.SongId
	where dbo.MusicOwner.AccountId = @OwnerId
end
go
--test1
exec usp_getMyMusic 1
--💀7 searchMusic(type: -artist, -title)
drop proc usp_searchMusic
go
create proc usp_searchMusic
	@Music nvarchar(100),
	@Type tinyint, -- 0:title, 1:artist
	@PageNumber int,
	@RowsPage int
as
begin
	if(@Type = 0)
	begin
		-- this proc also get Title because there 's situation that we can filter by 'Like' operator
		with SearchMusic as (
			select dbo.Artist.ArtistName, dbo.Song.Title, dbo.Account.Name, dbo.MusicFile.FileName, dbo.MusicFile.FileId,
			ROW_NUMBER() over (PARTITION BY dbo.MusicOwner.FileId, dbo.Song.Title order by dbo.MusicOwner.FileId) as [Number], dbo.MusicOwner.AccountId
			from dbo.MusicOwner
			left join dbo.Artist on dbo.MusicOwner.ArtistId = dbo.Artist.ArtistId
			inner join dbo.Song on dbo.MusicOwner.SongId = dbo.Song.SongId
			inner join dbo.Account on dbo.MusicOwner.AccountId = dbo.Account.AccountId
			inner join dbo.MusicFile on dbo.MusicOwner.FileId = dbo.MusicFile.FileId
		)
		select ArtistName, Title, Name, FileName, FileId from SearchMusic
		where Title like '%' + @Music + '%' and [Number] = '1'
		order by Title
		OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
		FETCH NEXT @RowsPage ROWS ONLY
	end
	if(@Type = 1)
	begin
		with SearchMusic as (
			select dbo.Artist.ArtistName, dbo.Song.Title, dbo.Account.Name, dbo.MusicFile.FileName, dbo.MusicFile.FileId,
			ROW_NUMBER() over (PARTITION BY dbo.MusicOwner.FileId, dbo.Artist.ArtistName order by dbo.MusicOwner.FileId) as [Number], dbo.MusicOwner.AccountId
			from dbo.MusicOwner
			inner join dbo.Artist on dbo.MusicOwner.ArtistId = dbo.Artist.ArtistId
			left join dbo.Song on dbo.MusicOwner.SongId = dbo.Song.SongId
			inner join dbo.Account on dbo.MusicOwner.AccountId = dbo.Account.AccountId
			inner join dbo.MusicFile on dbo.MusicOwner.FileId = dbo.MusicFile.FileId
		)
		select ArtistName, Title, Name, FileName, FileId from SearchMusic
		where ArtistName like '%' + @Music + '%' and [Number] = '1'
		order by ArtistName
		OFFSET ((@PageNumber - 1) * @RowsPage) ROWS
		FETCH NEXT @RowsPage ROWS ONLY
	end
end
go
--test1 filter by Title
declare @MusicWordsSearch nvarchar(100) = N'i',
		@pageNumber int = 1,
		@rowsPage int = 50
exec usp_searchMusic @MusicWordsSearch, '0', @pageNumber, @rowsPage
select * from vw_song where Title = @MusicWordsSearch
select * from Song
go
--test2 Filtering by Artist
declare @MusicWordsSearch nvarchar(100) = N'i',
		@pageNumber int = 1,
		@rowsPage int = 5
exec usp_searchMusic @MusicWordsSearch, '1', @pageNumber, @rowsPage
select * from MusicOwner
go

--💀8 update audio
--💀9 getPopularMusic(getCategory + getMusic)
drop proc usp_getPopularMusic
go
create proc usp_getPopularMusic
as
begin
	select top 200 *
	from dbo.MusicFile
	inner join dbo.MusicOwner on dbo.MusicFile.FileId = dbo.MusicOwner.FileId
	order by dbo.MusicFile.ListenTimes desc
	
end
--💀10 addSongToMyMusic

--💀 getPostById
drop proc usp_getPostById
go

create proc usp_getPostById
	@OwnerId int,
	@PostId int
as
begin
	select * from Post
	where Post.AccountId = @OwnerId and Post.PostId = @PostId
end
go
--test1
declare @OwnerId int = 1,
		@PostId int = 1
exec usp_getPostById @OwnerId, @PostId
go

--💀 Get a post
drop proc usp_getAPost
go
create proc usp_getAPost
	@OwnerId int,
	@PostId int
as
begin
	declare @Type_Post BIT = 1
	select dbo.Post.PostId, dbo.Post.Content, dbo.Post.Time,
	dbo.Account.AccountId as [PostAccountId], dbo.Account.Name as [PostName], dbo.Account.Avatar,
	dbo.udf_get_counting_like_by_likePlaceId(@PostId, @Type_Post) as [CountingLikePost],
	dbo.udf_is_liked(@OwnerId, @PostId, @Type_Post) as [isLikedPost]
	from dbo.Post inner join dbo.Account on dbo.Post.AccountId = dbo.Account.AccountId where dbo.Post.PostId = @PostId
end
go
--test1
exec usp_getAPost 1, 35
go

--💀 11 Upload audio
drop proc usp_getMaxFileId
go

create proc usp_getMaxFileId
	@MaxFileId int out
as
begin
	select @MaxFileId = count(*) from MusicFile
	set @MaxFileId += 1
end
go
--test1
declare @MaxFileId int
exec usp_getMaxFileId @MaxFileId out
select @MaxFileId
go

drop proc usp_insertFile
go

create proc usp_insertFile
	@FileId int out,
	@FileName varchar(100)
as
	insert into MusicFile(FileName) values (@FileName)
	set @FileId = SCOPE_IDENTITY()
go

--test1
declare @FileId int
exec usp_insertFile @FileId out,'bandOnTheRun.mp3'
select @FileId
go
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Dungproc
--💀Friendproc demo
DROP proc usp_addfriend
GO
CREATE proc usp_addfriend
	@id1 int,
	@id2 int
AS
BEGIN
	INSERT INTO Relationship(UserId1, UserId2, Status) VALUES(@id1, @id2, '1')
END 
GO
--💀
DROP proc usp_acceptfriend
GO
CREATE proc usp_acceptfriend
	@id1 int,
	@id2 int
AS
BEGIN
	UPDATE Relationship SET Status='1' WHERE UserId1=@id2 AND UserId2=@id1 
END
UPDATE Relationship SET Status='1' WHERE UserId1='13' AND UserId2='1'
--💀
DROP proc usp_unfriend
GO
CREATE proc usp_unfriend
	@id1 int,
	@id2 int
AS
BEGIN
	DELETE FROM Relationship WHERE UserId1=@id2 AND UserId2=@id1 OR UserId1=@id1 AND UserId2=@id2
END
Go

--💀
DROP proc usp_unfriend
GO
CREATE proc usp_cancelfriend
	@id1 int,
	@id2 int
AS
BEGIN
	DELETE FROM Relationship WHERE 
END
go

--💀
DROP proc usp_blockfriend
GO
CREATE proc usp_blockfriend
	@id1 int,
	@id2 int
AS
BEGIN
	UPDATE Relationship SET Status='3' WHERE UserId1=@id1 AND UserId2=@id2 OR UserId1=@id2 AND UserId2=@id1
END

--💀
DROP proc usp_listfriend1
GO
CREATE proc usp_listfriend1
	@id int
AS
BEGIN
	SELECT RelationshipId, UserId1, Name, Online FROM Relationship
	JOIN Account ON Account.AccountId=Relationship.UserId1
	WHERE UserId2=4 AND Status='1' 
		union
	SELECT RelationshipId, UserId2, Name, Online FROM Relationship 
	JOIN Account ON Account.AccountId=Relationship.UserId1
	WHERE USerId1=4 AND Status='1'
END

--💀 search name
DROP proc usp_searchUser
GO

create proc usp_searchUser
	@ownerid int,
	@name nvarchar(30)
as
begin
	select AccountId, Name, Avatar, dbo.udf_getStatus(@ownerId, AccountId) as [Status] from Account
	where Name like '%' + @name + '%' and AccountId <> @ownerId
end
go

exec usp_searchUser 1, N'b'
go
select * from Relationship
go

