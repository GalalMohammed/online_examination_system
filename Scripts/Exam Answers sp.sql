CREATE PROCEDURE SampleTransactionProcedure
AS
BEGIN
    -- Start transaction
    BEGIN TRANSACTION;
    
   DECLARE @longString NVARCHAR(MAX) = 'A;A;C;D B';
DECLARE @word NVARCHAR(255);

-- Create a table variable to store split results
DECLARE @ParsedWords TABLE (word NVARCHAR(255));

-- Insert split words into the table
INSERT INTO @ParsedWords (word)
select * from @ParsedWords


SELECT value FROM STRING_SPLIT(@longString, ';');

    COMMIT TRANSACTION;
    
    -- Error handling (optional)
    -- ROLLBACK TRANSACTION; -- Uncomment if needed for rollback scenarios
END;




drop function SplitString

CREATE FUNCTION dbo.SplitString(@InputString NVARCHAR(MAX), @Delimiter CHAR(1))
RETURNS @Result TABLE (Element NVARCHAR(255))
AS
BEGIN
    DECLARE @pos INT = 0;
    DECLARE @nextPos INT;
    DECLARE @element NVARCHAR(255);

    WHILE CHARINDEX(@Delimiter, @InputString, @pos + 1) > 0
    BEGIN
        -- Find the next delimiter position
        SET @nextPos = CHARINDEX(@Delimiter, @InputString, @pos + 1);
        
        -- Extract the value and trim spaces
        SET @element = LTRIM(RTRIM(SUBSTRING(@InputString, @pos + 1, @nextPos - @pos - 1)));

        -- Insert only if it's not empty
        IF @element <> ''
            INSERT INTO @Result (Element) VALUES (@element);

        -- Move to the next position
        SET @pos = @nextPos;
    END;

    -- Handle the last value after the last `;`
    SET @element = LTRIM(RTRIM(SUBSTRING(@InputString, @pos + 1, LEN(@InputString) - @pos)));

    -- Insert only if it's not empty
    IF @element <> ''
        INSERT INTO @Result (Element) VALUES (@element);

    RETURN;
END;

select * from SplitString('A;A;C;D;B;A;C;;D;', ';');


---------------------------------------------------------------------------


DECLARE @choice NVARCHAR(255);
DECLARE @Student_Id INT = 2; -- Replace with actual Student ID
DECLARE @Exam_Id INT = 1;  -- Replace with actual Exam ID
DECLARE @Question_Id INT = 63; -- Replace with actual Question ID
Declare @QOrder INT = 1;
-- Declare a cursor for the function result
DECLARE choice_cursor CURSOR FOR 
SELECT Element FROM dbo.SplitString('A;B;C;D;A;A;C;D;B;A', ';'); 

-- Example choices A, B, C, D

-- Open the cursor
OPEN choice_cursor;
FETCH NEXT FROM choice_cursor INTO @choice;

-- Loop through each choice and insert into StudentAnswer table
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Insert into StudentAnswer table
	
	set @Question_Id = (select Question_Id from Examination_System.dbo.ExamQuestion
	where Exam_Id = @Exam_Id AND Question_Order = @QOrder )

    INSERT INTO Examination_System.dbo.StudentAnswer 
        (Student_Id, Exam_Id, Question_Id, Choice)
    VALUES 
        (@Student_Id, @Exam_Id, @Question_Id, @choice);

		set @QOrder = @QOrder + 1;
    -- Fetch the next value
    FETCH NEXT FROM choice_cursor INTO @choice;
END;

-- Close and deallocate the cursor
CLOSE choice_cursor;
DEALLOCATE choice_cursor;
