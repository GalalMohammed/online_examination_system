USE [Examination_System]
GO

/****** Object:  Table [dbo].[Exam]    Script Date: 16-Jan-25 6:26:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Exams' Table
CREATE TABLE [dbo].[Exam](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each exam
	[Name] [varchar](100) NULL, -- Name of the exam
	[Date] [date] NOT NULL, -- Date of the exam
	[Course_Id] [int] NOT NULL, -- Foreign key linking to the course
	[Instructor_Id] [int] NOT NULL,
	[MCQ_Grade] [decimal](5, 2) NOT NULL, -- Grade for multiple choice questions
	[TF_Grade] [decimal](5, 2) NOT NULL, -- Grade for true/false questions
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Add foreign key constraints
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id])
GO

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course]
GO

ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Instructor] FOREIGN KEY([Instructor_Id])
REFERENCES [dbo].[Instructor] ([Id])
GO

ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Instructor]
GO

