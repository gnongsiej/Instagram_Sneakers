USE [instagram]
GO

ALTER TABLE [dbo].[MetadataChanges] DROP CONSTRAINT [FK_MetadataChanges_Metadata]
GO

/****** Object:  Table [dbo].[MetadataChanges]    Script Date: 4/2/2023 2:24:57 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MetadataChanges]') AND type in (N'U'))
DROP TABLE [dbo].[MetadataChanges]
GO

/****** Object:  Table [dbo].[MetadataChanges]    Script Date: 4/2/2023 2:24:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MetadataChanges](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MetadataID] [int] NOT NULL,
	[DateChanged] [date] NOT NULL,
	[PreviousValue] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_MetadataChanges] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MetadataChanges]  WITH CHECK ADD  CONSTRAINT [FK_MetadataChanges_Metadata] FOREIGN KEY([MetadataID])
REFERENCES [dbo].[Metadata] ([ID])
GO

ALTER TABLE [dbo].[MetadataChanges] CHECK CONSTRAINT [FK_MetadataChanges_Metadata]
GO

