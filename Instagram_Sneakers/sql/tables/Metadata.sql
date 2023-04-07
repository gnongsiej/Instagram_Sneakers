USE [instagram]
GO

/****** Object:  Table [dbo].[Metadata]    Script Date: 4/2/2023 2:24:43 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Metadata]') AND type in (N'U'))
DROP TABLE [dbo].[Metadata]
GO

/****** Object:  Table [dbo].[Metadata]    Script Date: 4/2/2023 2:24:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Metadata](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FieldKey] [nvarchar](50) NOT NULL,
	[FieldValue] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Metadata] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

