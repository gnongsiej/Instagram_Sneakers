USE [instagram]
GO

/****** Object:  StoredProcedure [dbo].[AddOrUpdateMetadata]    Script Date: 4/2/2023 9:46:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Gabriel Nongsiej
-- Create date: April 2, 2023
-- Description:	Insert or modify metadata
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[AddOrUpdateMetadata]
	@FieldName nvarchar(200), 
	@FieldValue nvarchar(2000)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ChangedId int
	DECLARE @ChangedFieldValue nvarchar(2000) = NULL

	IF EXISTS(SELECT * FROM [dbo].[Metadata] WHERE FieldKey = @FieldName)
		BEGIN
			SELECT TOP 1 
				@ChangedId = ID, 
				@ChangedFieldValue = FieldValue 
			FROM [dbo].[Metadata] 
			WHERE FieldKey = @FieldName;

			UPDATE [dbo].[Metadata] 
				SET FieldValue = @FieldValue 
				WHERE FieldKey = @FieldName;
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Metadata] (FieldKey, FieldValue)
				VALUES (@FieldName, @FieldValue);
			SET @ChangedId = SCOPE_IDENTITY()
		END

	EXEC [dbo].[RecordMetadataChanges] @ChangedId, NULL, @ChangedFieldValue;
END
GO

