GO
ALTER DATABASE [Examination_System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examination_System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Examination_System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examination_System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examination_System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examination_System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examination_System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Examination_System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Examination_System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Examination_System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examination_System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examination_System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examination_System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examination_System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examination_System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examination_System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examination_System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Examination_System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examination_System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examination_System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examination_System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examination_System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examination_System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examination_System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examination_System] SET RECOVERY FULL 
GO
ALTER DATABASE [Examination_System] SET  MULTI_USER 
GO
ALTER DATABASE [Examination_System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Examination_System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examination_System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examination_System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Examination_System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Examination_System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Examination_System', N'ON'
GO
ALTER DATABASE [Examination_System] SET QUERY_STORE = ON
GO
ALTER DATABASE [Examination_System] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Examination_System]
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 17-Jan-25 4:00:00 PM ******/
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
/****** Object:  Table [dbo].[Course]    Script Date: 17-Jan-25 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the 'Course' Table
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each course
	[Name] [varchar](100) NOT NULL, -- Name of the course
	[Description] [varchar](100) NULL, -- Optional description of the course
	[Duration] [int] NULL, -- Duration of the course in hours
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 17-Jan-25 4:00:00 PM ******/
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
/****** Object:  Table [dbo].[Enrollment]    Script Date: 17-Jan-25 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the 'Course_Enrollment' Table
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
/****** Object:  Table [dbo].[Exam]    Script Date: 17-Jan-25 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the 'Exam' Table
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
/****** Object:  Table [dbo].[ExamQuestion]    Script Date: 17-Jan-25 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the 'ExamQuestion' Table
CREATE TABLE [dbo].[ExamQuestion](
	[Exam_Id] [int] NOT NULL, -- Foreign key linking to the exam table
	[Question_Id] [int] NOT NULL, -- Foreign key linking to the question table
	[Question_Order] [int] NOT NULL, -- Order of the question in the exam
 CONSTRAINT [PK_ExamQuestion] PRIMARY KEY CLUSTERED -- Composite primary key
(
	[Exam_Id] ASC,
	[Question_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 17-Jan-25 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the 'Instructor' Table
CREATE TABLE [dbo].[Instructor](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each instructor
	[Name] [varchar](100) NOT NULL, -- Name of the instructor
	[Email] [varchar](100) NOT NULL, -- Email of the instructor
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
/****** Object:  Table [dbo].[Question]    Script Date: 17-Jan-25 4:00:00 PM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 17-Jan-25 4:00:00 PM ******/
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
/****** Object:  Table [dbo].[StudentAnswer]    Script Date: 17-Jan-25 4:00:00 PM ******/
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
/****** Object:  Table [dbo].[Teaching]    Script Date: 17-Jan-25 4:00:00 PM ******/
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
/****** Object:  Table [dbo].[Topic]    Script Date: 17-Jan-25 4:00:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create the 'Topic' Table
CREATE TABLE [dbo].[Topic](
	[Id] [int] IDENTITY(1,1) NOT NULL, -- Unique identifier for each topic
	[Name] [varchar](100) NOT NULL, -- Name of the topic
	[Course_Id] [int] NOT NULL, -- Foreign key linking to the course
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Add foreign key constraints
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_Question] FOREIGN KEY([Question_Id])
REFERENCES [dbo].[Question] ([Id]) -- Enforces question-choice relationship
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Question]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Instructor] FOREIGN KEY([Manager_Id])
REFERENCES [dbo].[Instructor] ([Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Instructor]
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
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id]) -- Enforces instructor-department relationship
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO
-- Add foreign key constraints to link questions to courses
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Course]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id]) -- Enforces student-department relationship
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
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
ALTER TABLE [dbo].[Teaching]  WITH CHECK ADD  CONSTRAINT [FK_Teaching_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Teaching] CHECK CONSTRAINT [FK_Teaching_Course]
GO
ALTER TABLE [dbo].[Teaching]  WITH CHECK ADD  CONSTRAINT [FK_Teaching_Instructor] FOREIGN KEY([Instructor_Id])
REFERENCES [dbo].[Instructor] ([Id]) -- Enforces instructor-course relationship
GO
ALTER TABLE [dbo].[Teaching] CHECK CONSTRAINT [FK_Teaching_Instructor]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Id]) -- Enforces course-topic relationship
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Course]
GO
USE [master]
GO
ALTER DATABASE [Examination_System] SET  READ_WRITE 
GO
