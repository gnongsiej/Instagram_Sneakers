USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[GetTrendForFollower]    Script Date: 4/2/2023 10:00:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Show trend for follower
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[GetTrendForFollower] 
	@UserName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT DateAdded, DateRemoved
	FROM [dbo].[Followers]
	WHERE UserID = (
		SELECT ID
		FROM [dbo].[Users]
		WHERE UserName = @UserName
	)
END
GO

