USE [Examination_System]
GO

/****** Object:  Table [dbo].[Topic]    Script Date: 16-Jan-25 6:28:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Topic' Table
CREATE TABLE [dbo].[Topic](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each topic
	[Name] [varchar](100) NOT NULL, -- Name of the topic
	[Course_Id] [int] NOT NULL, -- Foreign key linking to the course
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Enforces course-topic relationship
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id])
GO

ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Course]
GO

