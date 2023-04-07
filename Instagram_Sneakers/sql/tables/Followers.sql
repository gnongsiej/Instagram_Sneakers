USE [instagram]
GO

ALTER TABLE [dbo].[Followers] DROP CONSTRAINT [FK_Followers_Users]
GO

/****** Object:  Table [dbo].[Followers]    Script Date: 4/2/2023 2:23:25 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Followers]') AND type in (N'U'))
DROP TABLE [dbo].[Followers]
GO

/****** Object:  Table [dbo].[Followers]    Script Date: 4/2/2023 2:23:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Followers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateAdded] [date] NOT NULL,
	[DateRemoved] [date] NULL,
 CONSTRAINT [PK_Followers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Followers]  WITH CHECK ADD  CONSTRAINT [FK_Followers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO

ALTER TABLE [dbo].[Followers] CHECK CONSTRAINT [FK_Followers_Users]
GO

