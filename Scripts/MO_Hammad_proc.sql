
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





--=========================EXAM Correction =========================


select * from ExamQuestion

SELECT  * FROM ExamQuestion EQ 
	inner join  Question Q
	on EQ .Question_Id = Q.Id and EQ.Exam_Id = 9

	SELECT  Exam_Id,eq.Question_Id,text, type,Choice FROM ExamQuestion EQ 
	inner join  Question Q
	on EQ .Question_Id = Q.Id
	left  join Choice ch
	on Q.Id = ch.Question_Id
	where  EQ.Exam_Id = 9
	
	
	
	

 

CREATE OR ALTER PROCEDURE ExamCorrection
    @Exam_Id INT,
    @Student_Id INT
AS
BEGIN
    DECLARE @Course_Id INT;
    DECLARE @MCQ_Grade DECIMAL(5,2);
    DECLARE @TF_Grade DECIMAL(5,2);
    DECLARE @Total_MCQ INT;
    DECLARE @Total_TF INT;
    DECLARE @Correct_MCQ INT;
    DECLARE @Correct_TF INT;
    DECLARE @Total_Exam_Marks DECIMAL(18,2);
    DECLARE @Student_Score DECIMAL(18,2);
    DECLARE @Percentage DECIMAL(18,2);

    BEGIN TRY
        BEGIN TRANSACTION;

        -- Get Exam Details
        SELECT @Course_Id = Course_Id,
               @MCQ_Grade = MCQ_Grade,
               @TF_Grade = TF_Grade
        FROM Exam
        WHERE Id = @Exam_Id;

        -- Validate if Exam exists
        IF @Course_Id IS NULL
        BEGIN
            select 'Exam not found!';
            ROLLBACK;
            RETURN;
        END

		IF not exists(select * from StudentAnswer where Student_Id =@Student_Id)
        BEGIN
            select 'the stundent did not slove exam yet !';
            ROLLBACK;
            RETURN;
        END

        -- Get total number of MCQ and TF questions in the exam

		SELECT  @Total_TF=COUNT(*) FROM ExamQuestion EQ 
		inner join  Question Q
		on EQ .Question_Id = Q.Id and Type ='TF' and EQ.Exam_Id = @Exam_Id

		SELECT @Total_MCQ = COUNT(*) FROM ExamQuestion EQ 
		inner join  Question Q
		on EQ .Question_Id = Q.Id and Type ='MCQ'and EQ.Exam_Id = @Exam_Id


		

		update  SA
				set Grade = case when 
									Q.type ='MCQ' and Q.Answer =SA.Choice then @MCQ_Grade
								when
									Q.type ='TF' and Q.Answer =SA.Choice then @TF_Grade
								ELSE 0
							END
				from StudentAnswer SA
					 inner join ExamQuestion EQ
					 on  SA.Question_Id= EQ.Question_Id
					 inner join Question Q
					 on Q.Id =EQ.Question_Id
					 WHERE SA.Student_Id =@Student_Id AND SA.Exam_Id =@Exam_Id


        -- Get number of correct answers by the student

        SELECT @Correct_MCQ = COUNT(*)  
		from StudentAnswer SA
					 inner join ExamQuestion EQ
					 on  SA.Question_Id= EQ.Question_Id
					 inner join Question Q
					 on Q.Id =EQ.Question_Id
					 WHERE SA.Student_Id =@Student_Id 
							AND SA.Exam_Id =@Exam_Id  
							and Type = 'MCQ' 
							and SA.Grade >0
												
		
		SELECT @Correct_TF = COUNT(*)  
		from StudentAnswer SA
					 inner join ExamQuestion EQ
					 on  SA.Question_Id= EQ.Question_Id
					 inner join Question Q
					 on Q.Id =EQ.Question_Id
					 WHERE SA.Student_Id =@Student_Id 
							AND SA.Exam_Id =@Exam_Id  
							and Type = 'TF' 
							and SA.Grade >0

        -- Calculate Total Possible Score
        SET @Total_Exam_Marks = (@Total_MCQ * @MCQ_Grade) + (@Total_TF * @TF_Grade);

        -- Calculate Student's Score
        SET @Student_Score = (@Correct_MCQ * @MCQ_Grade) + (@Correct_TF * @TF_Grade);

        -- Avoid division by zero
        IF @Total_Exam_Marks = 0
        BEGIN
            select 'Error: Exam has no questions!';
            ROLLBACK;
            RETURN;
        END

        -- Calculate Percentage
        SET @Percentage = (@Student_Score / @Total_Exam_Marks) * 100;

        -- Update Enrollment Table with the student's percentage
        UPDATE Enrollment
        SET Grade = @Percentage
        WHERE Course_Id = @Course_Id AND Student_Id = @Student_Id;

        -- Check if Enrollment record exists before updating
        IF @@ROWCOUNT = 0
        BEGIN
            select 'Student is not enrolled in the course!';
            ROLLBACK;
            RETURN;
        END

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        select 'ExamCorrection ERROR => ' + ERROR_MESSAGE();
    END CATCH
END;






