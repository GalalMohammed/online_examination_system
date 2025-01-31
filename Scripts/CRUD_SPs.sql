USE Examination_System;

--Student table
--- Insert
create or alter proc Insert_Student
	@fname varchar(50),
	@lname varchar(50),
	@mail varchar(100),
	@pass varbinary(255),
	@address varchar(100),
	@age int,
	@deparment_ID int
as
	Begin try
		insert into dbo.Student(Fname,Lname,Email,Password,Address,Age,Department_Id) 
		values (@fname,@lname,@mail,@pass,@address,@age,@deparment_ID)
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Update
create or alter proc Update_Student
	@SID int,
	@fname varchar(50),
	@lname varchar(50),
	@mail varchar(100),
	@pass varbinary(255),
	@address varchar(100),
	@age int,
	@deparment_ID int
as
	Begin try
		update dbo.Student
		set Fname=@fname,
			Lname=@lname,
			Email=@mail,
			Password=@pass,
			Address=@address,
			Age=@age,
			Department_Id=@deparment_ID
		where Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Delete
create or alter proc Delete_Student
	@SID int
as
	Begin try
		Delete from dbo.Student
		where Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Select
create or alter proc Select_Student
	@SID int
as
	Begin try
		Select * from dbo.Student
		where Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

-- StudnetAnswer table
--- Insert
create or alter proc Insert_StudentAnswer
	@SID int,
	@EID int,
	@QID int,
	@Choice varchar(100),
	@grade decimal(5,2)
as
	Begin try
		insert into dbo.StudentAnswer(Student_Id,Exam_Id,Question_Id,Choice,Grade)
		values (@SID,@EID,@QID,@Choice,@grade)
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Update
create or alter proc Update_StudentAnswer
	@SID int,
	@EID int,
	@QID int,
	@Choice varchar(100),
	@grade decimal(5,2)
as
	Begin try
		update dbo.StudentAnswer
		set Exam_Id=@EID,
			Question_Id=@QID,
			Choice=@Choice,
			Grade=@grade
		where Student_Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Delete
create or alter proc Delete_StudentAnswer
	@SID int
as
	Begin try
		Delete from dbo.StudentAnswer
		where Student_Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Select
create or alter proc Select_StudentAnswer
	@SID int
as
	Begin try
		Select * from dbo.StudentAnswer
		where Student_Id=@SID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

-- Department table
--- Insert
create or alter proc Insert_Department
	@name varchar(50),
	@Des varchar(100),
	@MID int
as
	Begin try
		insert into dbo.Department(Name,Description,Manager_Id)
		values (@name,@Des,@MID)
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Update
create or alter proc Update_Department
	@DID int,
	@name varchar(50),
	@Des varchar(100),
	@MID int
as
	Begin try
		update dbo.Department
		set Name=@name,
			Description=@Des,
			Manager_Id=@MID
		where Id=@DID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Delete
create or alter proc Delete_Department
	@DID int
as
	Begin try
		Delete from dbo.Department
		where Id=@DID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

--- Select
create or alter proc Select_Department
	@DID int
as
	Begin try
		Select * from dbo.Department
		where Id=@DID;
	end try
	begin catch
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	end catch

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Create a choice record
-- =============================================
CREATE OR ALTER PROCEDURE SP_cChoice
	@questionId int, 
	@choiceText varchar(100)
AS
BEGIN TRY
	INSERT INTO Choice VALUES (@questionId, @choiceText);
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Retrieve question's choices
-- =============================================
CREATE OR ALTER PROCEDURE SP_rChoices 
	@questionId int
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Choice FROM Choice WHERE Question_Id=@questionId;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Update a choice text
-- =============================================
CREATE OR ALTER PROCEDURE SP_uChoice 
	@questionId int, 
	@oldChoiceText varchar(100),
	@newChoiceText varchar(100)
AS
BEGIN TRY
	UPDATE Choice SET Choice=@newChoiceText WHERE Question_Id=@questionId AND Choice=@oldChoiceText;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Delete a choice record
-- =============================================
CREATE OR ALTER PROCEDURE SP_dChoice 
	@questionId int, 
	@choiceText varchar(100) 
AS
BEGIN TRY
	DELETE FROM Choice WHERE Question_Id=@questionId AND Choice=@choiceText;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Create a question record
-- =============================================
CREATE OR ALTER PROCEDURE SP_cQuestion
	@questionText varchar(100), 
	@questionType varchar(50),
	@questionAnswer varchar(100),
	@courseId int
AS
BEGIN TRY
	IF @questionType='MCQ' OR @questionType='TF'
		INSERT INTO Question(Text, Type, Answer, Course_Id) VALUES (@questionText, @questionType, @questionAnswer, @courseId);
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Retrieve a course's questions
-- =============================================
CREATE OR ALTER PROCEDURE SP_rQuestions
	@courseId int, 
	@questionType varchar(50)
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Question WHERE Course_Id=@courseId AND Type=@questionType;
END	TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Update a question record
-- =============================================
CREATE OR ALTER PROCEDURE SP_uQuestion
	@questionId int, 
	@questionText varchar(100) = '',
	@questionType varchar(50),
	@questionAnswer varchar(100),
	@courseId int
AS
BEGIN TRY
	IF @questionType='MCQ' OR @questionType='TF'
		UPDATE Question SET Text=@questionText, Type=@questionType, Answer=@questionAnswer, Course_Id=@courseId WHERE Id=@questionId;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Delete a question record
-- =============================================
CREATE OR ALTER PROCEDURE SP_dQuestion 
	@questionId int
AS
BEGIN TRY
	DELETE FROM Question WHERE Id=@questionId;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Create an examQuestion record
-- =============================================
CREATE OR ALTER PROCEDURE SP_cExamQuestion
	@examId int,
	@questionId int,
	@questionOrder int
AS
BEGIN TRY
	INSERT INTO ExamQuestion VALUES (@examId, @questionId, @questionOrder);
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Retrieve exam questions
-- =============================================
CREATE OR ALTER PROCEDURE SP_rExamQuestions
	@examId int
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Question_Id, Question_Order FROM ExamQuestion WHERE Exam_Id=@examId ORDER BY Question_Order;
END	TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Update an exam question
-- =============================================
CREATE OR ALTER PROCEDURE SP_uExamQuestion
	@examID int, 
	@questionId int,
	@questionOrder int
AS
BEGIN TRY
	UPDATE ExamQuestion SET Question_Id=@questionId, Question_Order=@questionOrder WHERE Exam_Id=@examID AND Question_Id=@questionId;
END	TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Delete an exam question record
-- =============================================
CREATE OR ALTER PROCEDURE SP_dExamQuestion
	@examId int,
	@questionId int
AS
BEGIN TRY
	DELETE FROM ExamQuestion WHERE Exam_Id=@examId AND Question_Id=@questionId;
END	TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO


--=========================Instructor=======================
-- Insert into Instructor

CREATE OR Alter PROCEDURE InsertInstructor
    @Name VARCHAR(255),
    @Email VARCHAR(255),
    @Password VARCHAR(255),
    @Degree VARCHAR(255),
    @Address VARCHAR(255),
    @HourRate DECIMAL(10,2),
    @Salary DECIMAL(10,2),
	@Department_Id int
As
BEGIN
BEGIN TRY
	   BEGIN TRANSACTION;


	   INSERT INTO Instructor (Name, Email, Password, Degree, Address,Hour_Rate, Salary,Department_Id)
		VALUES (@Name, @Email,CONVERT(varbinary(255),@Password) , @Degree, @Address, @HourRate, @Salary,@Department_Id);
		COMMIT
END TRY
BEGIN CATCH
		SELECT 'InsertInstructor PROC  ERROR =>',ERROR_LINE(),ERROR_MESSAGE()
		ROLLBACK;
END CATCH

END;



-- Delete Instructor
CREATE OR ALTER PROCEDURE DeleteInstructor
    @Id INT
AS
BEGIN
   BEGIN TRY
	   BEGIN TRANSACTION;
	   DELETE FROM Instructor WHERE Id = @Id;
	   COMMIT;
   END TRY
   BEGIN CATCH
		SELECT 'DeleteInstructor PROC  ERROR =>', ERROR_LINE(),ERROR_MESSAGE()
		ROLLBACK;
   END CATCH

END;

-- Update Instructor
CREATE OR Alter PROCEDURE UpdateInstructor
    @Id INT,
    @Name VARCHAR(255),
    @Email VARCHAR(255),
    @Password Varchar(255),
    @Degree VARCHAR(255),
    @Address VARCHAR(255),
    @HourRate DECIMAL(10,2),
    @Salary DECIMAL(10,2),
	@Department_Id int,
	@Bonus DECIMAL(10,2)
AS
BEGIN

	BEGIN TRY
		 BEGIN TRANSACTION;

    UPDATE Instructor
			SET Name = @Name, Email = @Email, Password = CONVERT(varbinary(255),@Password), 
				Degree = @Degree, Address = @Address, 
				Hour_Rate = @HourRate, Salary = @Salary,
				Department_Id =@Department_Id,
				Bonus =@Bonus
			WHERE Id = @Id;
		 COMMIT;
	END TRY
	BEGIN CATCH
        SELECT 'UpdateInstructor PROC  ERROR =>', ERROR_LINE(),ERROR_MESSAGE()
		ROLLBACK;
	END CATCH


END;

--select * from Instructor


	
	



-- Select Instructors
CREATE OR Alter PROCEDURE GetInstructor @Id int=null
AS
BEGIN
    Begin try
		Begin transaction
			if @Id is not null
			SELECT * FROM Instructor
			where Id =@Id
			else
			SELECT * FROM Instructor

		commit;
	End Try
	Begin Catch
		
        SELECT 'GET Instructor PROC  ERROR =>', ERROR_LINE(),ERROR_MESSAGE()
		Rollback;
	End Catch
END;
--exec UpdateInstructor 121,'mo khaled','mo@testUpdate','mo khaled','MODEGREE','cairo',null,null,2,2.5


--exec GetInstructor 11



--=========================EXAM=======================
-- Insert into EXAM

CREATE OR Alter PROCEDURE InsertExam
  @Name VARCHAR(100),
    @Date DATE,
    @Course_Id INT,
    @Instructor_Id INT,
    @MCQ_Grade DECIMAL(5,2),
    @TF_Grade DECIMAL(5,2)
As
BEGIN
BEGIN TRY
	   BEGIN TRANSACTION;

		   INSERT INTO Exam (Name, Date, Course_Id, Instructor_Id, MCQ_Grade, TF_Grade)
        VALUES (@Name, @Date, @Course_Id, @Instructor_Id, @MCQ_Grade, @TF_Grade);
		COMMIT
END TRY
BEGIN CATCH
		SELECT 'InsertExam PROC  ERROR =>',ERROR_LINE(),ERROR_MESSAGE()
		ROLLBACK;
END CATCH

END;

--UpdateExam

CREATE OR ALTER PROCEDURE UpdateExam
    @Id INT,
    @Name VARCHAR(100),
    @Date DATE,
    @Course_Id INT,
    @Instructor_Id INT,
    @MCQ_Grade DECIMAL(5,2),
    @TF_Grade DECIMAL(5,2)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        
        UPDATE Exam
        SET Name = @Name, 
            Date = @Date, 
            Course_Id = @Course_Id, 
            Instructor_Id = @Instructor_Id, 
            MCQ_Grade = @MCQ_Grade, 
            TF_Grade = @TF_Grade
        WHERE Id = @Id;
        
        COMMIT;
    END TRY
    BEGIN CATCH
        select 'UpdateExam ERROR => ' ,ERROR_LINE(), ERROR_MESSAGE();
        ROLLBACK;
    END CATCH
END;

--DeleteExam
CREATE OR ALTER PROCEDURE DeleteExam
    @Id INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM Exam WHERE Id = @Id;
    END TRY
    BEGIN CATCH
		select 'DeleteExam ERROR => ' ,ERROR_LINE(), ERROR_MESSAGE();
    END CATCH
END;

--SelectExaM
CREATE OR ALTER PROCEDURE SelectExam
    @Id INT = NULL -- Optional parameter
AS
BEGIN
    IF @Id IS NULL
        SELECT * FROM Exam; -- Get all exams
    ELSE
        SELECT * FROM Exam WHERE Id = @Id; -- Get specific exam
END;



--EXEC UpdateExam 8, 'Final Exam', '2024-05-15', 2, 5, 25.00, 15.00;
--EXEC InsertExam 'Midterm Exam', '2024-02-01', 2, 5, 20.50, 10.00;
--select * from Exam

--exec DeleteExam 66
--exec SelectExam 1



--=========================Enrollment=======================

--InsertEnrollment
CREATE OR ALTER PROCEDURE InsertEnrollment
    @Course_Id INT,
    @Student_Id INT,
    @Grade DECIMAL(18,2) = NULL -- Grade is nullable
AS
BEGIN
    BEGIN TRY
		BEGIN transaction
        INSERT INTO Enrollment (Course_Id, Student_Id, Grade)
        VALUES (@Course_Id, @Student_Id, @Grade);
		commit
    END TRY
    BEGIN CATCH
			select 'InsertEnrollment Proc ERROR => ' ,ERROR_LINE(), ERROR_MESSAGE();
			Rollback
    END CATCH
END;


--UpdateEnrollment

CREATE OR ALTER PROCEDURE UpdateEnrollment
    @Course_Id INT,
    @Student_Id INT,
    @Grade DECIMAL(18,2) = NULL
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        
        UPDATE Enrollment
        SET Grade = @Grade
        WHERE Course_Id = @Course_Id AND Student_Id = @Student_Id;
        
        COMMIT;
    END TRY
    BEGIN CATCH
		select 'UpdateEnrollment Proc ERROR => ' ,ERROR_LINE(), ERROR_MESSAGE();
        ROLLBACK;
    END CATCH
END;




--DeleteEnrollment

CREATE OR ALTER PROCEDURE DeleteEnrollment
    @Course_Id INT,
    @Student_Id INT
AS
BEGIN
    BEGIN TRY
		begin transaction
			DELETE FROM Enrollment WHERE Course_Id = @Course_Id AND Student_Id = @Student_Id;
		commit
    END TRY
    BEGIN CATCH
		select 'UpdateEnrollment Proc ERROR => ' ,ERROR_LINE(), ERROR_MESSAGE();
        rollback
    END CATCH
END;




--SelectEnrollment

CREATE OR ALTER PROCEDURE SelectEnrollment
    @Course_Id INT = NULL,
    @Student_Id INT = NULL
AS
BEGIN
    IF @Course_Id IS NULL AND @Student_Id IS NULL
        SELECT * FROM Enrollment; -- Get all enrollments
    ELSE IF @Course_Id IS NOT NULL AND @Student_Id IS NULL
        SELECT * FROM Enrollment WHERE Course_Id = @Course_Id; -- Get enrollments for a course
    ELSE IF @Course_Id IS NULL AND @Student_Id IS NOT NULL
        SELECT * FROM Enrollment WHERE Student_Id = @Student_Id; -- Get enrollments for a student
    ELSE
        SELECT * FROM Enrollment WHERE Course_Id = @Course_Id AND Student_Id = @Student_Id; -- Specific record
END;



--select * from Enrollment
--select * from Course
--select * from student


--EXEC InsertEnrollment 1, 2, 85.50;
--EXEC UpdateEnrollment 1, 8, 90.00;
--EXEC DeleteEnrollment 1, 2


-- Get all enrollments
--EXEC SelectEnrollment;
-- Get enrollments for Course ID 2
--EXEC SelectEnrollment 2, NULL;
-- Get enrollments for Student ID 3
--EXEC SelectEnrollment NULL, 3;

CREATE PROCEDURE [dbo].[Insert_Course]
    @Name NVARCHAR(100), 
    @Description NVARCHAR(100) = NULL, 
    @Duration INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Course] ([Name], [Description], [Duration])
    VALUES (@Name, @Description, @Duration);

    PRINT 'Course inserted successfully.';
END;

EXEC [dbo].[Insert_Course] @Name = 'Physics 101', @Description = 'Introduction to Physics', @Duration = 40;



CREATE PROCEDURE [dbo].[Update_Course]
    @Id INT, 
    @Name NVARCHAR(100), 
    @Description NVARCHAR(100) = NULL, 
    @Duration INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Course]
    SET [Name] = @Name, 
        [Description] = @Description, 
        [Duration] = @Duration
    WHERE [Id] = @Id;

    PRINT 'Course updated successfully.';
END;
GO

CREATE PROCEDURE [dbo].[Select_Course]
    @Id INT = NULL -- Optional, if NULL selects all courses
AS
BEGIN
    SET NOCOUNT ON;

    IF @Id IS NOT NULL
    BEGIN
        SELECT * FROM [dbo].[Course] WHERE [Id] = @Id;
    END
    ELSE
    BEGIN
        SELECT * FROM [dbo].[Course];
    END
END;
GO

CREATE PROCEDURE [dbo].[Delete_Course]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Course] WHERE [Id] = @Id;

    PRINT 'Course deleted successfully.';
END;
GO
exec [dbo].[Delete_Course] @id = 8;


/* ********************************************************** */ 

CREATE PROCEDURE [dbo].[Insert_Topic]
    @Name NVARCHAR(100),
    @Course_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate that the course exists
    IF EXISTS (SELECT 1 FROM [dbo].[Course] WHERE [Id] = @Course_Id)
    BEGIN
        INSERT INTO [dbo].[Topic] ([Name], [Course_Id])
        VALUES (@Name, @Course_Id);

        PRINT 'Topic inserted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Invalid Course_Id. The referenced course does not exist.';
    END
END;
GO

CREATE PROCEDURE [dbo].[Select_Topic]
    @Course_Id INT = NULL -- Optional parameter
AS
BEGIN
    SET NOCOUNT ON;

    IF @Course_Id IS NOT NULL
    BEGIN
        SELECT * FROM [dbo].[Topic] WHERE [Course_Id] = @Course_Id;
    END
    ELSE
    BEGIN
        SELECT * FROM [dbo].[Topic];
    END
END;
GO

CREATE PROCEDURE [dbo].[Update_Topic]
    @Id INT, 
    @Name NVARCHAR(100), 
    @Course_Id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate that the course exists
    IF EXISTS (SELECT 1 FROM [dbo].[Course] WHERE [Id] = @Course_Id)
    BEGIN
        UPDATE [dbo].[Topic]
        SET [Name] = @Name, [Course_Id] = @Course_Id
        WHERE [Id] = @Id;

        PRINT 'Topic updated successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Invalid Course_Id. The referenced course does not exist.';
    END
END;
GO


CREATE PROCEDURE [dbo].[Delete_Topic]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[Topic] WHERE [Id] = @Id;

    PRINT 'Topic deleted successfully.';
END;
GO

-- Insert topics related to courses
EXEC [dbo].[Insert_Topic] @Name = 'Process Management', @Course_Id = 1;
EXEC [dbo].[Insert_Topic] @Name = 'Memory Management', @Course_Id = 1;
EXEC [dbo].[Insert_Topic] @Name = 'Network Protocols', @Course_Id = 2;
EXEC [dbo].[Insert_Topic] @Name = 'Database Design', @Course_Id = 3;
EXEC [dbo].[Insert_Topic] @Name = 'Pointers', @Course_Id = 4;
EXEC [dbo].[Insert_Topic] @Name = 'Inheritance', @Course_Id = 5;
EXEC [dbo].[Insert_Topic] @Name = 'Tree Structures', @Course_Id = 6;
EXEC [dbo].[Insert_Topic] @Name = 'Delegates', @Course_Id = 7;

CREATE PROCEDURE sp_InsertTeaching
    @Course_Id INT,
    @Instructor_Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    INSERT INTO Teaching (Course_Id, Instructor_Id)
    VALUES (@Course_Id, @Instructor_Id);
END;
GO

CREATE PROCEDURE sp_GetAllTeaching
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT T.Course_Id, T.Instructor_Id, 
           C.Name AS Course_Name, 
           I.Name AS Instructor_Name
    FROM Teaching T
    JOIN Course C ON T.Course_Id = C.Id
    JOIN Instructor I ON T.Instructor_Id = I.Id;
END;
GO

CREATE PROCEDURE sp_GetTeachingById
    @Course_Id INT,
    @Instructor_Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT T.Course_Id, T.Instructor_Id, 
           C.Name AS Course_Name, 
           I.Name AS Instructor_Name
    FROM Teaching T
    JOIN Course C ON T.Course_Id = C.Id
    JOIN Instructor I ON T.Instructor_Id = I.Id
    WHERE T.Course_Id = @Course_Id AND T.Instructor_Id = @Instructor_Id;
END;
GO

CREATE PROCEDURE sp_UpdateTeaching
    @Old_Course_Id INT,
    @Old_Instructor_Id INT,
    @New_Course_Id INT,
    @New_Instructor_Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM Teaching 
    WHERE Course_Id = @Old_Course_Id AND Instructor_Id = @Old_Instructor_Id;

    INSERT INTO Teaching (Course_Id, Instructor_Id)
    VALUES (@New_Course_Id, @New_Instructor_Id);
END;
GO

CREATE PROCEDURE sp_DeleteTeaching
    @Course_Id INT,
    @Instructor_Id INT
AS
BEGIN
    SET NOCOUNT ON;
    
    DELETE FROM Teaching 
    WHERE Course_Id = @Course_Id AND Instructor_Id = @Instructor_Id;
END;
GO


-- Assign Instructors to Courses
EXEC sp_InsertTeaching @Course_Id = 1, @Instructor_Id = 1; -- Operating Systems - mohDiab
EXEC sp_InsertTeaching @Course_Id = 2, @Instructor_Id = 2; -- Computer Networks - maboSehly
EXEC sp_InsertTeaching @Course_Id = 3, @Instructor_Id = 3; -- SQL - Rami
EXEC sp_InsertTeaching @Course_Id = 4, @Instructor_Id = 4; -- C - Hany
EXEC sp_InsertTeaching @Course_Id = 5, @Instructor_Id = 5; -- OOP - Sherehan
EXEC sp_InsertTeaching @Course_Id = 6, @Instructor_Id = 1; -- Data Structure - mohDiab
EXEC sp_InsertTeaching @Course_Id = 7, @Instructor_Id = 2; -- C# - maboSehly


EXEC sp_GetAllTeaching;

EXEC sp_GetTeachingById @Course_Id = 3, @Instructor_Id = 3; -- SQL - Rami
EXEC sp_GetTeachingById @Course_Id = 5, @Instructor_Id = 5; -- OOP - Sherehan

-- Change the instructor for SQL from Rami (ID 3) to Hany (ID 4)
EXEC sp_UpdateTeaching 
    @Old_Course_Id = 3, 
    @Old_Instructor_Id = 3, 
    @New_Course_Id = 3, 
    @New_Instructor_Id = 4;

-- Change the instructor for C from Hany (ID 4) to Sherehan (ID 5)
EXEC sp_UpdateTeaching 
    @Old_Course_Id = 4, 
    @Old_Instructor_Id = 4, 
    @New_Course_Id = 4, 
    @New_Instructor_Id = 5;

	EXEC sp_DeleteTeaching @Course_Id = 6, @Instructor_Id = 1; -- Remove Data Structure - mohDiab
EXEC sp_DeleteTeaching @Course_Id = 7, @Instructor_Id = 2; -- Remove C# - maboSehly
