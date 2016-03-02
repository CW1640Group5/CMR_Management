use MusicNetwork
go

--////////////////💀 COUNTING LIKE////////////////
Drop FUNCTION dbo.udf_get_counting_like_by_likePlaceId
go
Create FUNCTION dbo.udf_get_counting_like_by_likePlaceId
(
	@likePlaceId int,
	@type bit
)
RETURNS int
AS
BEGIN
	declare @count int
	select @count = Count(*) from Likes where LikePlaceId = @likePlaceId and Type = @type
	RETURN @count
END
go

--test1
select dbo.udf_get_counting_like_by_likePlaceId(50, 1) as amount
go

--test2 những người like 1 cái LikePlaceId
select P.PostId, P.AccountId as [PostOwnerId], P.Time as [PostTime],
	   L.LikeId, L.AccountId as [LikeOwnerId], L.Type,
	   A.Email from Post as P
join Likes as L on P.PostId = L.LikePlaceId and L.Type = 1
join Account as A on L.AccountId = A.AccountId
GO

--////////////////💀 RANDOM INTEGER////////////////
drop view v_getRand
go
CREATE VIEW v_getRand
AS
SELECT RAND() AS randomResult
GO

drop function dbo.udf_get_random_number
go
Create FUNCTION dbo.udf_get_random_number
(
	@lower int, @upper int
)
RETURNS int
AS
begin
	declare @random float, @result int
	select @random = randomResult from v_getRand
	set @result = ROUND(((@upper - @lower -1) * @random + @lower), 0)
	return @result
end
go

--test1
select dbo.udf_get_random_number(1, 3) as ran

--////////////////💀 CHECK LIKe////////////////
drop function dbo.udf_is_liked
go
create function dbo.udf_is_liked
(
	@OwnerId int,
	@LikePlaceId int,
	@Type bit
)
returns bit
as
begin
	declare @amount int
	select @amount = count(*) from Likes where AccountId = @OwnerId and LikePlaceId = @LikePlaceId and Type = @Type
	if(@amount = 0)
		return 0
	return 1
end
go

--test1
select * from vw_like_post where PostId = 2

declare @OwnerId int = 1,
		@LikePlaceId int = 1,
		@Type bit = 1
<<<<<<< .mine
select dbo.udf_is_liked( @OwnerId, @LikePlaceId, @Type) as [isLiked]
go

--////////////////💀 PROVE IS NOT FRIEND ////////////////
declare @OwnerId int = 1,
		@PersonId int = 7
if not exists( SELECT 1 from Relationship where ((UserId1 = @OwnerId and UserId2 = @PersonId) or (UserId1 = @PersonId and UserId2 = @OwnerId)) and Status = 1)
	select 'is not friend'



--////////////////💀 PROVE IS FRIEND ////////////////
--////////////////💀 PROVE YOU SEND REQUEST FRIEND ////////////////
--////////////////💀 PROVE SOMEONE SEND REQUEST FRIEND TO YOU ////////////////

--////////////////💀 GET RELATIONSHIP BETWEEN 2 PEOPLE ////////////////
drop function dbo.udf_getStatus
go
create function dbo.udf_getStatus
(@ownerId int, @personId int)
returns int
as
begin
	declare @status int
	select @status = Status from vw_relationship_request where RequestAccountId = @ownerId and PersonId = @personId
	if(@status > 0)
		return @status
	select @status = Status from vw_relationship_response where ResponseAccountId = @ownerId and PersonId = @personId
	if (@status is null)
		set @status = 0
	else if (@status = 2)
		set @status = 3
	return @status
end
go

--test1
select dbo.udf_getStatus(1, 7) as Status
go

--test2 get search name and relationship from those people to a OwnerId
declare @ownerId int = 1,
		@name nvarchar(60) = N'b'
select *, dbo.udf_getStatus(@ownerId, AccountId) as [Status] from Account
where Name like '%' + @name + '%' and AccountId <> @ownerId
go=======
select dbo.udf_is_liked( @OwnerId, @LikePlaceId, @Type) as [isLiked]


--////////////////💀 GET STATUS ////////////////
drop function dbo.udf_getStatus
go
create function dbo.udf_getStatus
(@ownerId int, @personId int)
returns int
as
begin
	declare @status int
	select @status = Status from vw_relationship_request where RequestAccountId = @ownerId and PersonId = @personId
	if(@status > 0)
		return @status
	select @status = Status from vw_relationship_response where ResponseAccountId = @ownerId and PersonId = @personId
	if (@status is null)
		set @status = 0
	else if (@status = 2)
		set @status = 3
	return @status
end
go>>>>>>> .r150
