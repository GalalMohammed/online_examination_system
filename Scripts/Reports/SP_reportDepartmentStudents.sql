SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		GalalMohammed
-- Create date: 31-1-2025
-- Description:	report of dapartment students
-- =============================================
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
