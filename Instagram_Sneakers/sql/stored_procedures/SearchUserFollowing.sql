USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[SearchUserFollowing]    Script Date: 4/2/2023 9:48:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Search for active following
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[SearchUserFollowing] 
	@UserName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @UserId int;
	DECLARE @FollowingId int;

	IF EXISTS(SELECT * FROM [dbo].[Users] WHERE UserName = @UserName)
		BEGIN
			SELECT TOP 1 
				@UserId = ID 
			FROM [dbo].[Users]
			WHERE UserName = @UserName

			SELECT TOP 1 
				@FollowingId = ID 
			FROM [dbo].[Following] 
			WHERE UserID = @UserId AND DateRemoved IS NULL

			IF @FollowingId IS NOT NULL
				RETURN @FollowingId
			ELSE
				RETURN NULL
		END
	ELSE
		RETURN NULL
END
GO

