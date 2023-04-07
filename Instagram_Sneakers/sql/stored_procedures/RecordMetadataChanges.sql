USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[RecordMetadataChanges]    Script Date: 4/2/2023 9:47:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Record changes to metadata in table
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[RecordMetadataChanges] 
	@MetadataID int, 
	@DateChanged date,
	@PreviousValue nvarchar(2000)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DateChangedToInsert date;

	IF (@DateChanged IS NULL)
		SET @DateChangedToInsert = CAST( GETDATE() AS DATE );
	ELSE
		SET @DateChangedToInsert = @DateChanged;

    INSERT INTO [dbo].[MetadataChanges] (MetadataID, DateChanged, PreviousValue)
		VALUES (@MetadataID, @DateChangedToInsert, @PreviousValue);		
END
GO

