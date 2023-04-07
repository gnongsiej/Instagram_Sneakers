USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[FetchActiveFollower]    Script Date: 4/2/2023 9:46:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Fetch active followers
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[FetchActiveFollower]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT UserName 
	FROM [dbo].[Users] 
	WHERE ID IN (
		SELECT UserID
		FROM [dbo].[Followers]
		WHERE DateRemoved IS NULL
	)
END
GO

