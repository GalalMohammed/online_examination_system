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
