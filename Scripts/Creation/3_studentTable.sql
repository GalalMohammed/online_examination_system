USE [Examination_System]
GO

/****** Object:  Table [dbo].[Student]    Script Date: 16-Jan-25 6:27:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Student' Table
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each student
	[Fname] [varchar](50) NOT NULL, -- First name of the student
	[Lname] [varchar](50) NOT NULL, -- Last name of the student
	[Email] [varchar](100) NOT NULL, -- Email address of the student
	[Password] [varbinary](255) NOT NULL, -- Storing encrypted passwords for security
	[Address] [varchar](100) NULL, -- Optional address of the student
	[Age] [int] NULL, -- Age of the student
	[Department_Id] [int] NOT NULL, -- Foreign key linking to the department
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id]) -- Enforces department-student relationship
GO

ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO

