window.repositoryObject = {"parameters":[{"name":"DID","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p68","name":"Select_Department","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Examination_System_DATA_Dictionary","id":"d2"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"Select_Department"},{"field":"Type","value":"Procedure"}],"script":"--- Select\r\ncreate   proc Select_Department\r\n\t@DID int\r\nas\r\n\tBegin try\r\n\t\tSelect * from dbo.Department\r\n\t\twhere Id=@DID;\r\n\tend try\r\n\tbegin catch\r\n\t\tSELECT ERROR_MESSAGE() AS ErrorMessage;\r\n\tend catch\r\n\r\nSET ANSI_NULLS ON","imported_at":"2025-02-01 01:13"};