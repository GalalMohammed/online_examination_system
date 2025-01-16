USE [Examination_System]
GO

/****** Object:  Table [dbo].[Instructor]    Script Date: 16-Jan-25 6:26:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Instructor' Table
CREATE TABLE [dbo].[Instructor](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each instructor
	[Name] [varchar](100) NOT NULL, -- Name of the instructor
	[Email] [varchar](100) NOT NULL, -- Email address of the instructor
	[Password] [varbinary](255) NOT NULL, -- Storing encrypted passwords for security
	[Degree] [varchar](100) NULL, -- Degree held by the instructor
	[Address] [varchar](100) NULL, -- Optional address of the instructor
	[Hour_Rate] [decimal](18, 0) NULL, -- Hourly rate for the instructor
	[Salary] [decimal](18, 0) NULL, -- Salary of the instructor
	[Bonus] [decimal](18, 0) NULL, -- Optional bonus amount
	[Department_Id] [int] NULL, -- Foreign key linking to the department
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id]) -- Enforces department-instructor relationship
GO

ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO

