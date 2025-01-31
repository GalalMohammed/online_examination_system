window.repositoryObject = {"parameters":[{"name":"Instructor_Id","description":null,"mode":"IN","data_type":"int","custom_fields":{},"linked_terms":[]}],"parameters_custom_fields":[],"dependencies":{"uses":[],"used_by":[]},"object_id":"p84","name":"SP_ReportingGetInstructorCourses","subtype":"PROCEDURE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Examination_System_DATA_Dictionary","id":"d2"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"SP_ReportingGetInstructorCourses"},{"field":"Type","value":"Procedure"}],"script":"CREATE   PROCEDURE SP_ReportingGetInstructorCourses\r\n    @Instructor_Id INT\r\nAS\r\nBEGIN\r\n   \r\n    SELECT C.Name,COUNT(E.Student_Id) AS StudentCount\r\n\tFROM Course C\r\n\tinner JOIN Enrollment E ON C.Id = E.Course_Id\r\n\tinner JOIN Teaching T ON T.Course_Id = E.Course_Id\r\n\twhere T.Instructor_Id=@Instructor_Id\r\n\tgroup by c.Name\r\nEND;","imported_at":"2025-02-01 01:13"};