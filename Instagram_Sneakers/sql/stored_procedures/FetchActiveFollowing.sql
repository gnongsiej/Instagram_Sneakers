USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[FetchActiveFollowing]    Script Date: 4/2/2023 9:47:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Fetch active following
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[FetchActiveFollowing] 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT UserName 
	FROM [dbo].[Users] 
	WHERE ID IN (
		SELECT UserID
		FROM [dbo].[Following]
		WHERE DateRemoved IS NULL
	)
END
GO

