drop trigger dbo.uniqueRelationship
go

CREATE TRIGGER dbo.uniqueRelationship
ON dbo.Relationship
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON
	declare @UserId1 int, @UserId2 int
	select @UserId1 = i.UserId1, @UserId2 = i.UserId2 from inserted i
    IF EXISTS 
    (
        SELECT 1 FROM dbo.Relationship where (UserId1 = @UserId1 and UserId2 = @UserId2) or
											 (UserId1 = @UserId2 and UserId2 = @UserId1)
    )
    BEGIN
        -- Do dupe handling here
        PRINT 'duplicate'
        raiserror('can not insert duplicate', 16, 1)
        return
    END

    -- actually add it in
        
    insert into Relationship(UserId1, UserId2, Status)
	select @UserId1, @UserId2, I.Status from INSERTED I
END
GO
--test1
insert into Relationship(UserId1, UserId2, Status) values (2, 1, 1)
