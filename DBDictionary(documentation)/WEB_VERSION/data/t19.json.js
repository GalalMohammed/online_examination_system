window.repositoryObject = {"columns_custom_fields":[],"relations_custom_fields":[],"unique_keys_custom_fields":[],"triggers_custom_fields":[],"columns":[{"id":"column-83","object_id":"column-83","name":"Id","name_without_path":"Id","description":null,"is_pk":true,"is_identity":true,"data_type":"int","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-84","object_id":"column-84","name":"Name","name_without_path":"Name","description":null,"is_pk":false,"is_identity":false,"data_type":"varchar","data_length":"100","is_nullable":true,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-85","object_id":"column-85","name":"Date","name_without_path":"Date","description":null,"is_pk":false,"is_identity":false,"data_type":"date","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-86","object_id":"column-86","name":"Course_Id","name_without_path":"Course_Id","description":null,"is_pk":false,"is_identity":false,"data_type":"int","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[{"id":"t22","name":"Course","name_show_schema":"dbo.Course"}],"linked_lookup":null},{"id":"column-87","object_id":"column-87","name":"Instructor_Id","name_without_path":"Instructor_Id","description":null,"is_pk":false,"is_identity":false,"data_type":"int","data_length":null,"is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[{"id":"t24","name":"Instructor","name_show_schema":"dbo.Instructor"}],"linked_lookup":null},{"id":"column-88","object_id":"column-88","name":"MCQ_Grade","name_without_path":"MCQ_Grade","description":null,"is_pk":false,"is_identity":false,"data_type":"decimal","data_length":"5, 2","is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null},{"id":"column-89","object_id":"column-89","name":"TF_Grade","name_without_path":"TF_Grade","description":null,"is_pk":false,"is_identity":false,"data_type":"decimal","data_length":"5, 2","is_nullable":false,"computed_formula":null,"default_value":null,"path":null,"level":1,"item_type":"COLUMN","is_user_defined":false,"custom_fields":{},"linked_terms":[],"references":[],"linked_lookup":null}],"relations":[{"name":"FK_Exam_Course","title":null,"description":null,"is_user_defined":false,"foreign_table":"Exam","foreign_table_show_schema":"dbo.Exam","foreign_table_verbose":"Exam","foreign_table_verbose_show_schema":"dbo.Exam","foreign_table_object_id":"t19","primary_table":"Course","primary_table_show_schema":"dbo.Course","primary_table_verbose":"Course","primary_table_verbose_show_schema":"dbo.Course","primary_table_object_id":"t22","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"Id","foreign_column_path":null,"foreign_column":"Course_Id"}],"custom_fields":{}},{"name":"FK_Exam_Instructor","title":null,"description":null,"is_user_defined":false,"foreign_table":"Exam","foreign_table_show_schema":"dbo.Exam","foreign_table_verbose":"Exam","foreign_table_verbose_show_schema":"dbo.Exam","foreign_table_object_id":"t19","primary_table":"Instructor","primary_table_show_schema":"dbo.Instructor","primary_table_verbose":"Instructor","primary_table_verbose_show_schema":"dbo.Instructor","primary_table_object_id":"t24","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"Id","foreign_column_path":null,"foreign_column":"Instructor_Id"}],"custom_fields":{}},{"name":"FK_ExamQuestion_Exam","title":null,"description":null,"is_user_defined":false,"foreign_table":"ExamQuestion","foreign_table_show_schema":"dbo.ExamQuestion","foreign_table_verbose":"ExamQuestion","foreign_table_verbose_show_schema":"dbo.ExamQuestion","foreign_table_object_id":"t20","primary_table":"Exam","primary_table_show_schema":"dbo.Exam","primary_table_verbose":"Exam","primary_table_verbose_show_schema":"dbo.Exam","primary_table_object_id":"t19","pk_cardinality":"1x","fk_cardinality":"mx","constraints":[{"primary_column_path":null,"primary_column":"Id","foreign_column_path":null,"foreign_column":"Exam_Id"}],"custom_fields":{}}],"unique_keys":[{"name":"PK_Exam","description":null,"is_pk":true,"is_user_defined":false,"columns":[{"path":null,"name_without_path":"Id","name":"Id","column_id":83}],"custom_fields":{}}],"triggers":[],"dependencies":{"uses":[{"object_name":"Exam","object_name_show_schema":"dbo.Exam","object_type":"TABLE","object_id":"t19","type":"NORMAL","object_user_defined":false,"user_defined":false,"children":[{"object_name":"Course","object_name_show_schema":"dbo.Course","object_type":"TABLE","object_id":"t22","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]},{"object_name":"Instructor","object_name_show_schema":"dbo.Instructor","object_type":"TABLE","object_id":"t24","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]}]}],"used_by":[{"object_name":"Exam","object_name_show_schema":"dbo.Exam","object_type":"TABLE","object_id":"t19","type":"NORMAL","object_user_defined":false,"user_defined":false,"children":[{"object_name":"ExamQuestion","object_name_show_schema":"dbo.ExamQuestion","object_type":"TABLE","object_id":"t20","type":"RELATION","pk_cardinality":"1x","fk_cardinality":"mx","object_user_defined":false,"user_defined":false,"children":[]}]}]},"object_id":"t19","name":"Exam","subtype":"TABLE","is_user_defined":false,"description":null,"summary":[{"field":"Documentation","value":{"_type":"link","name":"Examination_System_DATA_Dictionary","id":"d2"}},{"field":"Schema","value":"dbo"},{"field":"Name","value":"Exam"},{"field":"Type","value":"Table"}],"script":"","imported_at":"2025-02-01 01:12"};