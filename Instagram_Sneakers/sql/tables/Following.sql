USE [instagram]
GO

ALTER TABLE [dbo].[Following] DROP CONSTRAINT [FK_Following_Users]
GO

/****** Object:  Table [dbo].[Following]    Script Date: 4/2/2023 2:24:34 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Following]') AND type in (N'U'))
DROP TABLE [dbo].[Following]
GO

/****** Object:  Table [dbo].[Following]    Script Date: 4/2/2023 2:24:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Following](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateAdded] [date] NOT NULL,
	[DateRemoved] [date] NULL,
 CONSTRAINT [PK_Following] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Following]  WITH CHECK ADD  CONSTRAINT [FK_Following_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[Following] CHECK CONSTRAINT [FK_Following_Users]
GO

