window.repositoryObject = {"parameters":[{"name":"examId","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]},{"name":"questionId","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]},{"name":"questionOrder","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p75","name":"SP_cExamQuestion","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Examination_System_DATA_Dictionary","id":"d2"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"SP_cExamQuestion"},{"field":"Type","value":"Procedure"}],"script":"-- =============================================\r\n-- Author:\t\tGalalMohammed\r\n-- Create date: 28-1-2025\r\n-- Description:\tCreate an examQuestion record\r\n-- =============================================\r\nCREATE   PROCEDURE SP_cExamQuestion\r\n\t@examId int,\r\n\t@questionId int,\r\n\t@questionOrder int\r\nAS\r\nBEGIN TRY\r\n\tINSERT INTO ExamQuestion VALUES (@examId, @questionId, @questionOrder);\r\nEND TRY\r\nBEGIN CATCH\r\n\tSELECT ERROR_MESSAGE() AS ErrorMessage;\r\nEND CATCH","imported_at":"2025-02-01 01:13"};