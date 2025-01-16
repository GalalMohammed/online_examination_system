USE [Examination_System]
GO

/****** Object:  Table [dbo].[ExamQuestion]    Script Date: 16-Jan-25 6:26:29 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'ExamQuestion' Table
CREATE TABLE [dbo].[ExamQuestion](
	[Exam_Id] [int] NOT NULL, -- Foreign key linking to the exam table
	[Question_Id] [int] NOT NULL, -- Foreign key linking to the question table
	[Question_Order] [int] NOT NULL, -- The order of the question in the exam
 CONSTRAINT [PK_ExamQuestion] PRIMARY KEY CLUSTERED -- Composite primary key
(
	[Exam_Id] ASC,
	[Question_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Add foreign key constraints
ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ExamQuestion_Exam] FOREIGN KEY([Exam_Id])
REFERENCES [dbo].[Exam] ([Id])
GO

ALTER TABLE [dbo].[ExamQuestion] CHECK CONSTRAINT [FK_ExamQuestion_Exam]
GO

ALTER TABLE [dbo].[ExamQuestion]  WITH CHECK ADD  CONSTRAINT [FK_ExamQuestion_Question] FOREIGN KEY([Question_Id])
REFERENCES [dbo].[Question] ([Id])
GO

ALTER TABLE [dbo].[ExamQuestion] CHECK CONSTRAINT [FK_ExamQuestion_Question]
GO

