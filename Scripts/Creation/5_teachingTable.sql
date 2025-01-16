USE [Examination_System]
GO

/****** Object:  Table [dbo].[Teaching]    Script Date: 16-Jan-25 6:27:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Teaching](
	[Course_Id] [int] NOT NULL,
	[Instructor_Id] [int] NOT NULL, -- Foreign key linking to the instructor table
 CONSTRAINT [PK_Teaching] PRIMARY KEY CLUSTERED -- Composite primary key
(
	[Course_Id] ASC,
	[Instructor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Enforces instructor-course relationship
ALTER TABLE [dbo].[Teaching]  WITH CHECK ADD  CONSTRAINT [FK_Teaching_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id])
GO

ALTER TABLE [dbo].[Teaching] CHECK CONSTRAINT [FK_Teaching_Course]
GO

ALTER TABLE [dbo].[Teaching]  WITH CHECK ADD  CONSTRAINT [FK_Teaching_Instructor] FOREIGN KEY([Instructor_Id])
REFERENCES [dbo].[Instructor] ([Id])
GO

ALTER TABLE [dbo].[Teaching] CHECK CONSTRAINT [FK_Teaching_Instructor]
GO

