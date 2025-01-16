USE [Examination_System]
GO

/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 16-Jan-25 6:27:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'StudentAnswer' Table
CREATE TABLE [dbo].[StudentAnswer](
	[Student_Id] [int] NOT NULL, -- Foreign key linking to the student
	[Exam_Id] [int] NOT NULL, -- Foreign key linking to the exam table
	[Question_Id] [int] NOT NULL, -- Foreign key linking to the question table
	[Choice] [varchar](100) NOT NULL, -- The student's choice
	[Grade] [decimal](5, 2) NULL, -- The grade for the student's answer
 CONSTRAINT [PK_StudentAnswer] PRIMARY KEY CLUSTERED -- Composite primary key
(
	[Student_Id] ASC,
	[Exam_Id] ASC,
	[Question_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Add foreign key constraints
ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_ExamQuestion] FOREIGN KEY([Exam_Id], [Question_Id])
REFERENCES [dbo].[ExamQuestion] ([Exam_Id], [Question_Id])
GO

ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_ExamQuestion]
GO

ALTER TABLE [dbo].[StudentAnswer]  WITH CHECK ADD  CONSTRAINT [FK_StudentAnswer_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Id])
GO

ALTER TABLE [dbo].[StudentAnswer] CHECK CONSTRAINT [FK_StudentAnswer_Student]
GO

