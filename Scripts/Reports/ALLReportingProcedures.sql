CREATE OR ALTER PROCEDURE SP_reportDepartmentStudents
	@departmentId int
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  SELECT Id, Fname, Lname, Email, Address, Age FROM Student WHERE Department_Id=@departmentId;
END TRY
BEGIN CATCH
  SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO


---------------------------------------------------


CREATE OR ALTER PROCEDURE SP_ReportingGetStudentGrades
    @Student_Id INT
AS
BEGIN
    SELECT C.Name AS CourseName, E.Grade,
              convert(decimal(5,2),(E.Grade * 100) / 100) AS Percentage
    FROM Enrollment E
    INNER JOIN Course C ON E.Course_Id = C.Id
    WHERE E.Student_Id = @Student_Id;
END;


------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_ReportingGetInstructorCourses
    @Instructor_Id INT
AS
BEGIN
   
    SELECT C.Name,COUNT(E.Student_Id) AS StudentCount
	FROM Course C
	inner JOIN Enrollment E ON C.Id = E.Course_Id
	inner JOIN Teaching T ON T.Course_Id = E.Course_Id
	where T.Instructor_Id=@Instructor_Id
	group by c.Name
END;


-------------------------------------------------



CREATE OR ALTER PROCEDURE SP_ReportingGetCourseTopics
    @Course_Id INT
AS
BEGIN
    SELECT T.Name AS TopicName
    FROM Topic T
    WHERE T.Course_Id = @Course_Id;
END;

--------------------------------------------------------
CREATE OR ALTER PROCEDURE SP_ReportingGetExamQuestions
    @Exam_Id INT
AS
BEGIN
    -- Select existing choices
    SELECT  QuestionID, 
			QuestionText, 
			ChoiceText
			FROM 
		(
		SELECT 
        Q.Id AS QuestionID, 
        Q.Text AS QuestionText, 
        C.Choice AS ChoiceText,EQ.Question_Order
		FROM ExamQuestion EQ
		INNER JOIN Question Q ON EQ.Question_Id = Q.Id
		LEFT JOIN Choice C ON Q.Id = C.Question_Id
		WHERE EQ.Exam_Id = @Exam_Id AND C.Choice IS NOT NULL

    UNION ALL

    -- Add "True" where there are no choices
    SELECT 
        Q.Id AS QuestionID, 
        Q.Text AS QuestionText, 
        'True' AS ChoiceText,EQ.Question_Order
    FROM ExamQuestion EQ
    INNER JOIN Question Q ON EQ.Question_Id = Q.Id
    LEFT JOIN Choice C ON Q.Id = C.Question_Id
    WHERE EQ.Exam_Id = @Exam_Id AND C.Choice IS NULL

    UNION ALL

    -- Add "False" where there are no choices
    SELECT 
        Q.Id AS QuestionID, 
        Q.Text AS QuestionText, 
        'False' AS ChoiceText,EQ.Question_Order
    FROM ExamQuestion EQ
    INNER JOIN Question Q ON EQ.Question_Id = Q.Id
    LEFT JOIN Choice C ON Q.Id = C.Question_Id
    WHERE EQ.Exam_Id = @Exam_Id AND C.Choice IS NULL
	) AS TEMP

	ORDER BY Question_Order
END;


--exec SP_ReportingGetExamQuestions 7
--select * from Question

--------------------------------------------------------------------


CREATE OR ALTER PROCEDURE SP_ReportingGetStudentExamAnswers
    @Exam_Id INT,
    @Student_Id INT
AS
BEGIN
    SELECT Q.Id AS QuestionID, Q.Text AS QuestionText, 
           SA.Choice AS StudentAnswer ,Q.Answer AS TheCorrectAnswer ,case when  SA.Choice =Q.Answer then
																	'YOUR ASNWER IS CORRECT' 
																	else  'YOUR ASNWER IS WRONG' 
																	end as Message
    FROM StudentAnswer SA
    INNER JOIN Question Q ON SA.Question_Id = Q.Id
    WHERE SA.Exam_Id = @Exam_Id AND SA.Student_Id = @Student_Id;
END;


EXEC SP_ReportingGetStudentExamAnswers 7,2



















