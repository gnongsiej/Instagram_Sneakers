USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[AddFollowing]    Script Date: 4/2/2023 9:46:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Add user as active following
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[AddFollowing]
	@UserName nvarchar(50), 
	@DateAdded date
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DateAddedToInsert date;
	DECLARE @UserId int

	IF NOT EXISTS(SELECT * FROM [dbo].[Users] WHERE UserName = @UserName)
		BEGIN
			EXEC [dbo].[AddFollowing] @UserName, NULL
			SET @UserId = SCOPE_IDENTITY()
		END
	ELSE
		BEGIN
			SELECT @UserId = ID
			FROM [dbo].[Users]
			WHERE UserName = @UserName
		END

	IF (@DateAdded IS NULL)
		SET @DateAddedToInsert = CAST( GETDATE() AS DATE );
	ELSE
		SET @DateAddedToInsert = @DateAdded;
	INSERT INTO [dbo].[Following] (UserID, DateAdded) VALUES(@UserId, @DateAddedToInsert)
END
GO

