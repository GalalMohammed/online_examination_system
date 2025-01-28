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
BEGIN
	INSERT INTO Choice VALUES (@questionId, @choiceText);
END
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Retrieve question's choices
-- =============================================
CREATE OR ALTER PROCEDURE SP_rChoices 
	@questionId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Choice FROM Choice WHERE Question_Id=@questionId;
END
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
BEGIN
	UPDATE Choice SET Choice=@newChoiceText WHERE Question_Id=@questionId AND Choice=@oldChoiceText;
END
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
BEGIN
	DELETE FROM Choice WHERE Question_Id=@questionId AND Choice=@choiceText;
END
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
BEGIN
	IF @questionType='MCQ' OR @questionType='TF'
		INSERT INTO Question(Text, Type, Answer, Course_Id) VALUES (@questionText, @questionType, @questionAnswer, @courseId);
END
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
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Question WHERE Course_Id=@courseId AND Type=@questionType;
END
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
BEGIN
	IF @questionType='MCQ' OR @questionType='TF'
		UPDATE Question SET Text=@questionText, Type=@questionType, Answer=@questionAnswer, Course_Id=@courseId WHERE Id=@questionId;
END
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Delete a question record
-- =============================================
CREATE OR ALTER PROCEDURE SP_dQuestion 
	@questionId int
AS
BEGIN
	DELETE FROM Question WHERE Id=@questionId;
END
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
BEGIN
	INSERT INTO ExamQuestion VALUES (@examId, @questionId, @questionOrder);
END
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 28-1-2025
-- Description:	Retrieve exam questions
-- =============================================
CREATE OR ALTER PROCEDURE SP_rExamQuestions
	@examId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT Question_Id, Question_Order FROM ExamQuestion WHERE Exam_Id=@examId ORDER BY Question_Order;
END
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
BEGIN
	UPDATE ExamQuestion SET Question_Id=@questionId, Question_Order=@questionOrder WHERE Exam_Id=@examID AND Question_Id=@questionId;
END
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
BEGIN
	DELETE FROM ExamQuestion WHERE Exam_Id=@examId AND Question_Id=@questionId;
END
GO
