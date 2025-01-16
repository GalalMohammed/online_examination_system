USE [Examination_System]
GO

/****** Object:  Table [dbo].[Department]    Script Date: 16-Jan-25 6:25:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Create the 'Department' Table
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each department
	[Name] [varchar](50) NOT NULL, -- Name of the department
	[Description] [varchar](100) NULL, -- Optional description of the department
	[Manager_Id] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Instructor] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[Instructor] ([Id])
GO

ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Instructor]
GO

