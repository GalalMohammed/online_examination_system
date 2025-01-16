USE [Examination_System]
GO

/****** Object:  Table [dbo].[Choice]    Script Date: 16-Jan-25 6:19:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Choice' Table
CREATE TABLE [dbo].[Choice](
	[Question_Id] [int] NOT NULL, -- Foreign key linking to the question table
	[Choice] [varchar](100) NOT NULL, -- the choice
 CONSTRAINT [PK_Choice] PRIMARY KEY CLUSTERED -- Composite primary key
(
	[Question_Id] ASC,
	[Choice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_Question] FOREIGN KEY([Question_Id])
REFERENCES [dbo].[Question] ([Id]) -- Enforces question-choice relationship
GO

ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Question]
GO

