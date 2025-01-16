USE [Examination_System]
GO

/****** Object:  Table [dbo].[Course]    Script Date: 16-Jan-25 6:24:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Course' Table
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each course
	[Name] [varchar](100) NOT NULL, -- Name of the course
	[Description] [varchar](100) NULL, -- Optional description of the course
	[Duration] [int] NULL, -- Duration of the course in hours
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

