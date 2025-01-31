window.repositoryObject = {"parameters":[{"name":"Name","description":null,"mode":"IN","data_type":"nvarchar(100)","custom_fields":{},"linked_terms":[]},{"name":"Description","description":null,"mode":"IN","data_type":"nvarchar(100)","custom_fields":{},"linked_terms":[]},{"name":"Duration","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p58","name":"Insert_Course","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Examination_System_DATA_Dictionary","id":"d2"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"Insert_Course"},{"field":"Type","value":"Procedure"}],"script":"CREATE   PROCEDURE [dbo].[Insert_Course]\r\n    @Name NVARCHAR(100), \r\n    @Description NVARCHAR(100) = NULL, \r\n    @Duration INT = NULL\r\nAS\r\nBEGIN\r\n    SET NOCOUNT ON;\r\n\r\n    INSERT INTO [dbo].[Course] ([Name], [Description], [Duration])\r\n    VALUES (@Name, @Description, @Duration);\r\n\r\n    PRINT 'Course inserted successfully.';\r\nEND;","imported_at":"2025-02-01 01:13"};