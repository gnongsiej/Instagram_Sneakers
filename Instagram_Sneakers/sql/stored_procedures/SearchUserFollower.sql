USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[SearchUserFollower]    Script Date: 4/2/2023 9:47:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Search for active follower
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[SearchUserFollower] 
	@UserName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @UserId int;
	DECLARE @FollowerId int;

	IF EXISTS(SELECT * FROM [dbo].[Users] WHERE UserName = @UserName)
		BEGIN
			SELECT TOP 1 
				@UserId = ID 
			FROM [dbo].[Users]
			WHERE UserName = @UserName

			SELECT TOP 1 
				@FollowerId = ID 
			FROM [dbo].[Following] 
			WHERE UserID = @UserId AND DateRemoved IS NULL

			IF @FollowerId IS NOT NULL
				RETURN @FollowerId
			ELSE
				RETURN NULL
		END
	ELSE
		RETURN NULL
END
GO

