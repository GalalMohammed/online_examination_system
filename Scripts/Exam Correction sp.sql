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






