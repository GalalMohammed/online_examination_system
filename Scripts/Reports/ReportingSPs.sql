Declare  @InstructorID int = 1 ;

SELECT 
    c.Name AS CourseName, 
    COUNT(e.Student_Id) AS NumberOfStudents
FROM Teaching t
JOIN Course c ON t.Course_Id = c.Id
LEFT JOIN Enrollment e ON c.Id = e.Course_Id
WHERE t.Instructor_Id = @InstructorId
GROUP BY c.Id, c.Name;


CREATE PROCEDURE GetInstructorCoursesAndStudents
    @InstructorId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.Id AS CourseID, 
        c.Name AS CourseName, 
        COUNT(e.Student_Id) AS NumberOfStudents
    FROM Teaching t
    JOIN Course c ON t.Course_Id = c.Id
    LEFT JOIN Enrollment e ON c.Id = e.Course_Id
    WHERE t.Instructor_Id = @InstructorId
    GROUP BY c.Id, c.Name;
END;


EXEC GetInstructorCoursesAndStudents @InstructorId = 1;

-------------------------------------------------------------------------
CREATE PROCEDURE GetStudentsByDepartment
    @DepartmentId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        s.Id AS StudentID, 
        s.Fname AS FirstName, 
        s.Lname AS LastName, 
        s.Email, 
        s.Address, 
        s.Age, 
        d.Name AS DepartmentName
    FROM Student s
    JOIN Department d ON s.Department_Id = d.Id
    WHERE s.Department_Id = @DepartmentId;
END;

EXEC GetStudentsByDepartment @DepartmentId = 2;

------------------------------------------------------------
CREATE PROCEDURE GetCourseTopics
    @CourseId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        t.Id AS TopicID, 
        t.Name AS TopicName
    FROM Topic t
    WHERE t.Course_Id = @CourseId;
END;

EXEC GetCourseTopics @CourseId = 3;
---------------------------------------------
/*
CREATE PROCEDURE GetExamQuestionsAndChoices
    @ExamId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        q.Id AS QuestionID, 
        q.Text AS QuestionText, 
        STRING_AGG(c.Choice, ', ') AS Choices
    FROM ExamQuestion eq
    JOIN Question q ON eq.Question_Id = q.Id
    LEFT JOIN Choice c ON q.Id = c.Question_Id
    WHERE eq.Exam_Id = @ExamId
    GROUP BY q.Id, q.Text
    ORDER BY MIN(eq.Question_Order);
END;
*/
CREATE PROCEDURE GetExamQuestionsAndChoices
    @ExamId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Retrieve questions and choices, while handling True/False questions
    WITH ChoicesCTE AS (
        SELECT 
            q.Id AS QuestionID, 
            q.Text AS QuestionText,
            q.Type AS QuestionType, 
            c.Choice,
            q.Answer AS CorrectAnswer,  -- Correct answer for multiple-choice questions
            ROW_NUMBER() OVER (PARTITION BY q.Id ORDER BY c.Choice) AS ChoiceNumber
        FROM ExamQuestion eq
        JOIN Question q ON eq.Question_Id = q.Id
        LEFT JOIN Choice c ON q.Id = c.Question_Id
        WHERE eq.Exam_Id = @ExamId
    )

    -- Main select query with pivoting choices into separate columns
    SELECT 
        QuestionID, 
        QuestionText,
        
        -- For True/False questions, set Choice1 as 'True' and Choice2 as 'False'
        CASE 
            WHEN QuestionType = 'True/False' THEN 'True'
            ELSE ISNULL(MAX(CASE WHEN ChoiceNumber = 1 THEN Choice END), 'No Choice')  -- Default to 'No Choice' if no value exists
        END AS Choice1,

        CASE 
            WHEN QuestionType = 'True/False' THEN 'False'
            ELSE ISNULL(MAX(CASE WHEN ChoiceNumber = 2 THEN Choice END), 'No Choice')  -- Default to 'No Choice' if no value exists
        END AS Choice2,

        -- For True/False questions, set all other choices to 'False' or static value
        CASE 
            WHEN QuestionType = 'True/False' THEN 'False'
            ELSE ISNULL(MAX(CASE WHEN ChoiceNumber = 3 THEN Choice END), 'No Choice')  -- Default to 'No Choice' if no value exists
        END AS Choice3,

        CASE 
            WHEN QuestionType = 'True/False' THEN 'False'
            ELSE ISNULL(MAX(CASE WHEN ChoiceNumber = 4 THEN Choice END), 'No Choice')  -- Default to 'No Choice' if no value exists
        END AS Choice4,

        -- CorrectChoice will display the correct answer for multiple-choice questions
        CASE 
            WHEN QuestionType = 'True/False' THEN CorrectAnswer
            ELSE ISNULL(MAX(CASE WHEN Choice = CorrectAnswer THEN Choice END), 'No Correct Choice')  -- Default to 'No Correct Choice' if no value exists
        END AS CorrectChoice

    FROM ChoicesCTE
    GROUP BY QuestionID, QuestionText, QuestionType, CorrectAnswer
    ORDER BY QuestionID;
END;



EXEC GetExamQuestionsAndChoices @ExamId = 1;
drop procedure GetExamQuestionsAndChoices;

--------------------------------------------------------

CREATE PROCEDURE GetExamQuestionsWithStudentAnswers
    @ExamId INT,
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        q.Id AS QuestionID, 
        q.Text AS QuestionText, 
        sa.Choice AS StudentAnswer, 
        sa.Grade AS AnswerGrade
    FROM ExamQuestion eq
    JOIN Question q ON eq.Question_Id = q.Id
    LEFT JOIN StudentAnswer sa 
        ON q.Id = sa.Question_Id 
        AND sa.Exam_Id = @ExamId 
        AND sa.Student_Id = @StudentId
    WHERE eq.Exam_Id = @ExamId
    ORDER BY eq.Question_Order;
END;


EXEC GetExamQuestionsWithStudentAnswers @ExamId = 1, @StudentId = 2;
------------------------------------------------------------------------
CREATE PROCEDURE GetStudentGrades
    @StudentId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        c.Id AS CourseID,
        c.Name AS CourseName,
        COALESCE(e.Grade, 'untaken') AS StudentGrade
    FROM Enrollment e
    JOIN Course c ON e.Course_Id = c.Id
    WHERE e.Student_Id = @StudentId;
END;


EXEC GetStudentGrades @StudentId = 10;
drop procedure GetStudentGrades;