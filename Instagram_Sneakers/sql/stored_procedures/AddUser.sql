USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 4/2/2023 9:46:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Add users
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[AddUser]
	@UserName nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    IF NOT EXISTS(SELECT * FROM [dbo].[Users] WHERE UserName = @UserName)
		INSERT INTO [dbo].[Users] (UserName) VALUES (@UserName);
END
GO

