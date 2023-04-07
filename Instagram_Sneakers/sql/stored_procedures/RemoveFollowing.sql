USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[RemoveFollowing]    Script Date: 4/2/2023 9:47:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Remove active following
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[RemoveFollowing] 
	@UserName nvarchar(50),
	@DateRemoved date
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DateRemovedToInsert date;
	DECLARE @UserId int;

	EXEC @UserId = [dbo].[SearchUserFollowing] @UserName

	IF @UserId IS NOT NULL
		BEGIN
			IF @DateRemoved IS NULL
				SET @DateRemovedToInsert = CAST( GETDATE() AS DATE );
			ELSE
				SET @DateRemovedToInsert = @DateRemoved;

			UPDATE [dbo].[Following] SET DateRemoved = @DateRemovedToInsert WHERE UserID = @UserId
		END
END
GO

