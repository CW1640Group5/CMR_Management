use MusicNetwork
go

--/////////////// LIKE COMMENT ////////////////////
drop view vw_like_comment
go

create View vw_like_comment as
select dbo.Likes.LikeId, dbo.Account.AccountId as [LikeAccountId], dbo.Account.Email as [LikeEmail],
dbo.Comment.CommentId, dbo.Comment.Content as [CommentContent], dbo.Comment.Time as [TimeComment], dbo.Comment.AccountId as [CommentAccountId],
CommentAccount.Email as [CommentEmail],
dbo.Post.PostId, dbo.Post.Content as [PostContent], dbo.Post.Time as [PostTime], dbo.Post.AccountId as [PostAccountId],
PostAccount.Email as [PostEmail] from dbo.Likes
inner join dbo.Account on dbo.Likes.AccountId = dbo.Account.AccountId
inner join dbo.Comment on dbo.Likes.LikePlaceId = dbo.Comment.CommentId and dbo.Likes.Type = 0
inner join dbo.Account as CommentAccount on dbo.Comment.AccountId = CommentAccount.AccountId
inner join dbo.Post on dbo.Comment.PostId = dbo.Post.PostId
inner join dbo.Account as PostAccount on dbo.Post.AccountId = PostAccount.AccountId
go

--test1
select * from vw_like_comment
where CommentId = 1

--/////////////// LIKE POST ////////////////////
drop view vw_like_post
go

create view vw_like_post as
select dbo.Likes.LikeId, dbo.Account.AccountId as [LikeAccountId], dbo.Account.Email as [LikeEmail],
dbo.Post.PostId, dbo.Post.Content as [PostContent], dbo.Post.Time as [PostTime], dbo.Post.AccountId as [PostAccountId],
PostAccount.Email as [PostEmail]
from dbo.Likes
inner join dbo.Account on dbo.Likes.AccountId = dbo.Account.AccountId
inner join dbo.Post on dbo.Likes.LikePlaceId = dbo.Post.PostId and dbo.Likes.Type = 1
inner join dbo.Account as [PostAccount] on dbo.Post.AccountId = PostAccount.AccountId
go

--test1
select * from vw_like_post where PostId = 1

--/////////////// COMMENT ////////////////////
drop view vw_comment
go

create view vw_comment as
select dbo.Comment.CommentId, dbo.Comment.Content as [CommentContent], dbo.Comment.Time,
dbo.Account.AccountId as [CommentAccount], dbo.Account.Email,
dbo.Post.PostId, dbo.Post.Content as [PostContent], dbo.Post.Time as [PostTime],
PostAccount.AccountId as [PostAccountId], PostAccount.Email as [PostEmail],
dbo.Likes.LikeId,
LikeAccount.AccountId as [LikeAccountId], LikeAccount.Email as [LikeEmail]
from dbo.Comment
inner join dbo.Account on dbo.Comment.AccountId = dbo.Account.AccountId
inner join dbo.Post on dbo.Comment.PostId = dbo.Post.PostId
inner join dbo.Account as [PostAccount] on dbo.Post.AccountId = PostAccount.AccountId
left join (
dbo.Likes inner join dbo.Account as [LikeAccount] on dbo.Likes.AccountId = LikeAccount.AccountId)
on dbo.Comment.CommentId = dbo.Likes.LikePlaceId and dbo.Likes.Type = 0
go

-- test1
select * from vw_comment
where PostId = 1
order by CommentId
select * from vw_comment where PostId = 10
go
--/////////////// POST-COMMENT ////////////////////
drop view vw_post_comment
go

create view vw_post_comment as
select dbo.Post.PostId, dbo.Post.Content, dbo.Post.Time as [PostTime],
dbo.Account.AccountId as [PostAccount], dbo.Account.Email as [PostEmail],
dbo.Comment.CommentId, dbo.Comment.Content as [CommentContent], dbo.Comment.Time as [CommentTime],
CommentAccount.AccountId as [CommentAccountId], CommentAccount.Email as [CommentEmail]
from dbo.Post
inner join dbo.Account on dbo.Post.AccountId = dbo.Account.AccountId
left join (
dbo.Comment inner join dbo.Account as [CommentAccount] on dbo.Comment.AccountId = CommentAccount.AccountId)
on dbo.Post.PostId = dbo.Comment.PostId
go

--test1
select * from vw_post_comment where PostId = 10
--/////////////// POST-LIKE ////////////////////
drop view vw_post_like
go

create view vw_post_like as
select dbo.Post.PostId, dbo.Post.Content, dbo.Post.Time as [PostTime],
dbo.Account.AccountId as [PostAccount], dbo.Account.Email as [PostEmail],
dbo.Likes.LikeId,
LikeAccount.AccountId as [LikeAccountId], LikeAccount.Email as [LikeEmail]
from dbo.Post
inner join dbo.Account on dbo.Post.AccountId = dbo.Account.AccountId
left join (
dbo.Likes inner join dbo.Account as [LikeAccount] on dbo.Likes.AccountId = LikeAccount.AccountId)
on dbo.Post.PostId = dbo.Likes.LikePlaceId and dbo.Likes.Type = 1
go

--/////////////// MUSIC FILE ////////////////////
drop view vw_music_file
go
create view vw_music_file as
select dbo.MusicFile.*,
dbo.Account.AccountId, dbo.Account.Email,
dbo.Song.SongId, dbo.Song.Title,
dbo.Artist.ArtistId, dbo.Artist.ArtistName,
dbo.Category.CategoryId, dbo.Category.Name as [Category]
from dbo.MusicFile
left join(
	dbo.MusicOwner
	inner join dbo.Account on dbo.MusicOwner.AccountId = dbo.Account.AccountId
	inner join dbo.Song on dbo.MusicOwner.SongId = dbo.Song.SongId
	inner join dbo.Artist on dbo.MusicOwner.ArtistId = dbo.Artist.ArtistId
	inner join dbo.Category on dbo.MusicOwner.CategoryId = dbo.Category.CategoryId)
on dbo.MusicFile.FileId = dbo.MusicOwner.FileId
go
--test1
select * from vw_music_file

--/////////////// SONG ////////////////////
drop view vw_song
go
create view vw_song as
select dbo.Song.SongId, dbo.Song.Title,
dbo.Account.AccountId, dbo.Account.Email,
dbo.Artist.*,
dbo.Category.CategoryId, dbo.Category.Name as [CategoryName],
dbo.MusicFile.*
from dbo.Song
left join(
dbo.MusicOwner
left join dbo.Artist on dbo.MusicOwner.ArtistId = dbo.Artist.ArtistId
left join dbo.Category on dbo.MusicOwner.CategoryId = dbo.Category.CategoryId
inner join dbo.Account on dbo.MusicOwner.AccountId = dbo.Account.AccountId
inner join dbo.MusicFile on dbo.MusicOwner.FileId = dbo.MusicFile.FileId)
on dbo.Song.SongId = dbo.MusicOwner.SongId
go
--test1
select * from vw_song

--/////////////// RELATIONSHIP REQUEST ////////////////////
drop view vw_relationship_request
go

create view vw_relationship_request as
select RelationshipId, UserId1 as [RequestAccountId], UserId2 as [PersonId], Status
from Relationship
go

--/////////////// RELATIONSHIP RESPONSE ////////////////////
drop view vw_relationship_response
go
create view vw_relationship_response as
select RelationshipId, UserId2 as [ResponseAccountId], UserId1 as [PersonId], Status
from Relationship
go

<<<<<<< .mine


--💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮💮
=======
--test1
>>>>>>> .r150
declare @ownerId int = 1, @personId int = 2, @status nvarchar(20)
select @status = Status from vw_relationship_request
where RequestAccountId = @ownerId and PersonId = @personId
select @status


select dbo.udf_getStatus(1, 7) as Status

<<<<<<< .mine
=======

>>>>>>> .r150
