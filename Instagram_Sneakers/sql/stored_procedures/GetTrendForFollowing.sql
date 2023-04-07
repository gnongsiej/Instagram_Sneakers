USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[GetTrendForFollowing]    Script Date: 4/2/2023 10:00:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Show trend for following
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[GetTrendForFollowing]
	@UserName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT DateAdded, DateRemoved
	FROM [dbo].[Following]
	WHERE UserID = (
		SELECT ID
		FROM [dbo].[Users]
		WHERE UserName = @UserName
	)
END
GO

