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
