USE [Examination_System]
GO

/****** Object:  Table [dbo].[Enrollment]    Script Date: 16-Jan-25 6:25:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Course_Enrollments' Table
CREATE TABLE [dbo].[Enrollment](
	[Course_Id] [int] NOT NULL, -- Foreign key linking to the course
	[Student_Id] [int] NOT NULL, -- Foreign key linking to the student
	[Grade] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED -- Composite primary key
(
	[Course_Id] ASC,
	[Student_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Enforces course-student relationship
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id])
GO

ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Course]
GO

ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Student] ([Id])
GO

ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO

