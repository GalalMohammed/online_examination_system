USE [Examination_System]
GO

/****** Object:  Table [dbo].[Question]    Script Date: 16-Jan-25 6:26:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Question' Table
CREATE TABLE [dbo].[Question](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each question
	[Text] [varchar](100) NOT NULL, -- The question text
	[Type] [varchar](50) NOT NULL, -- The type of the question (e.g., MCQ, True/False)
	[Answer] [varchar](100) NOT NULL, -- The correct answer to the question
	[Course_Id] [int] NOT NULL, -- Foreign key linking to the course
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Add foreign key constraint to link questions to courses
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id])
GO

ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Course]
GO

