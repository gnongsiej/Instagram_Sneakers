USE [instagram]
GO

/****** Object:  Table [dbo].[Followers]    Script Date: 4/3/2023 1:01:05 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Followers]') AND type in (N'U'))
DROP TABLE [dbo].[Followers]
GO

USE [instagram]
GO

/****** Object:  Table [dbo].[Following]    Script Date: 4/3/2023 1:01:15 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Following]') AND type in (N'U'))
DROP TABLE [dbo].[Following]
GO

USE [instagram]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 4/3/2023 1:01:40 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 4/3/2023 1:01:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Is_Private] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [instagram]
GO

/****** Object:  Table [dbo].[Followers]    Script Date: 4/3/2023 1:01:56 AM ******/
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

USE [instagram]
GO

/****** Object:  Table [dbo].[Following]    Script Date: 4/3/2023 1:02:07 AM ******/
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

