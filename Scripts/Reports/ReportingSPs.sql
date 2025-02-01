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
        COALESCE(e.Grade, 0) AS StudentGrade
    FROM Enrollment e
    JOIN Course c ON e.Course_Id = c.Id
    WHERE e.Student_Id = @StudentId;
END;


EXEC GetStudentGrades @StudentId = 10;
