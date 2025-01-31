window.repositoryObject = {"parameters":[{"name":"name","description":null,"mode":"IN","data_type":"varchar(50)","custom_fields":{},"linked_terms":[]},{"name":"Des","description":null,"mode":"IN","data_type":"varchar(100)","custom_fields":{},"linked_terms":[]},{"name":"MID","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p59","name":"Insert_Department","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Examination_System_DATA_Dictionary","id":"d2"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"Insert_Department"},{"field":"Type","value":"Procedure"}],"script":"-- Department table\r\n--- Insert\r\ncreate   proc Insert_Department\r\n\t@name varchar(50),\r\n\t@Des varchar(100),\r\n\t@MID int\r\nas\r\n\tBegin try\r\n\t\tinsert into dbo.Department(Name,Description,Manager_Id)\r\n\t\tvalues (@name,@Des,@MID)\r\n\tend try\r\n\tbegin catch\r\n\t\tSELECT ERROR_MESSAGE() AS ErrorMessage;\r\n\tend catch","imported_at":"2025-02-01 01:13"};